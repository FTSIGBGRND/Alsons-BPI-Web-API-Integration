using FTSI_Web_API_System_Integration.DTOs;
using FTSI_Web_API_System_Integration.DTOs.ARCreditMemo;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;
using FTSI_Web_API_System_Integration.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace FTSI_Web_API_System_Integration.Controllers
{
    [Route("api/documents/arcreditmemo")]
    [ApiController]
    [Authorize]
    public class ARCreditMemoController : ControllerBase
    {
        private readonly ARCreditMemoService _service;

        public ARCreditMemoController(ARCreditMemoService service)
        {
            _service = service;
        }

        // POST api/<ARInvoiceController>
        [HttpPost("item")]
        public async Task<ActionResult<PostResponse>> PostItem([FromBody] ARCreditMemoItemHeaderDTO dto)
        {
            ARCreditMemoHeader header;

            try
            {
                header = await _service.AddAsync(dto);
            }
            catch (Exception ex)
            {
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = dto.U_RefNum ?? "" } });
            }

            return Ok(new PostResponse { Status = "Success", Message = "Successfully Saved.", Data = new PostResponseData { Id = header.Id, U_RefNum = header.U_RefNum ?? "" } });
        }

        [HttpPost("service")]
        public async Task<ActionResult<PostResponse>> PostService([FromBody] ARCreditMemoServiceHeaderDTO dto)
        {
            ARCreditMemoHeader header;

            try
            {
                header = await _service.AddAsync(dto);
            }
            catch (Exception ex)
            {
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = dto.U_RefNum ?? "" } });
            }

            return Ok(new PostResponse { Status = "Success", Message = "Successfully Saved.", Data = new PostResponseData { Id = header.Id, U_RefNum = header.U_RefNum ?? "" } });
        }

        [HttpGet("status/{id}")]
        public async Task<ActionResult<GetResponse>> GetStatus(Guid id)
        {

            ARCreditMemoHeader header = new ARCreditMemoHeader();
            string integStatus = string.Empty;

            try
            {
                header = await _service.GetStatusAsync(id);

                if (header == null)
                {
                    return NotFound(new GetResponse { Status = "Error", Message = $"Id [{id}] Not Found.", Data = new GetResponseData { Id = id } });
                }

                switch (header.IntegrationStatus)
                {
                    case 'P':
                        integStatus = "Pending";
                        break;
                    case 'E':
                        integStatus = "Error";
                        break;
                    case 'S':
                        integStatus = "Success";
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                return BadRequest(new GetResponse { Status = "Error", Message = ex.Message, Data = new GetResponseData { U_RefNum = header.U_RefNum, Id = id } });
            }

            return Ok(new GetResponse { Status = "Success", Message = "Integration Status Successfully Retrieved.", Data = new GetResponseData { IntegrationStatus = integStatus, IntegrationMessage = header.IntegrationMessage ?? "", U_RefNum = header.U_RefNum ?? "", Id = id } });
        }

        [HttpPost("cancel/{id}")]
        public async Task<ActionResult<PostResponse>> Cancel(Guid id)
        {

            ARCreditMemoHeader header = new ARCreditMemoHeader();
            string integStatus = string.Empty;

            try
            {
                header = await _service.GetStatusAsync(id);

                if (header == null)
                {
                    return NotFound(new PostResponse { Status = "Error", Message = $"Id [{id}] Not Found.", Data = new PostResponseData { Id = id, U_RefNum = "" } });
                }

                if (header.Canceled == 'Y')
                {
                    return UnprocessableEntity(new PostResponse { Status = "Error", Message = $"Document already cancelled on {header.CancelDate}", Data = new PostResponseData { Id = id, U_RefNum = header.U_RefNum } });
                }

                if (header.IntegrationStatus != 'S')
                {
                    return UnprocessableEntity(new PostResponse { Status = "Error", Message = "Cannot cancel not posted documents", Data = new PostResponseData { Id = id, U_RefNum = header.U_RefNum } });
                }

                await _service.CancelAsync(header);
            }
            catch (Exception ex)
            {
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = header.U_RefNum, Id = id } });
            }

            return Ok(new PostResponse { Status = "Success", Message = "Cancellation Successfully Saved.", Data = new PostResponseData { Id = header.Id, U_RefNum = header.U_RefNum} });
        }

    }
}
