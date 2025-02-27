using FTSI_Web_API_System_Integration.DTOs;
using FTSI_Web_API_System_Integration.DTOs.ARInvoice;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice;
using FTSI_Web_API_System_Integration.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace FTSI_Web_API_System_Integration.Controllers
{
    [Route("api/documents/arinvoice")]
    [ApiController]
    [Authorize]
    public class ARInvoiceController : ControllerBase
    {
        private readonly ARInvoiceService _service;

        public ARInvoiceController(ARInvoiceService service)
        {
            _service = service;
        }

        // POST api/<ARInvoiceController>
        [HttpPost("item")]
        public async Task<ActionResult<PostResponse>> PostARInvoiceItem([FromBody] ARInvoiceItemHeaderDTO arInvoiceDTO)
        {
            ARInvoiceHeader arInvoiceHeader;

            try
            {
                arInvoiceHeader = await _service.AddAsync(arInvoiceDTO);
            }
            catch (Exception ex)
            {
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = arInvoiceDTO.U_RefNum ?? "" } });
            }

            return Ok(new PostResponse { Status = "Success", Message = "Successfully Saved.", Data = new PostResponseData { Id = arInvoiceHeader.Id, U_RefNum = arInvoiceHeader.U_RefNum ?? "" } });
        }

        // POST api/<ARInvoiceController>
        [HttpPost("service")]
        public async Task<ActionResult<PostResponse>> PostARInvoiceService([FromBody] ARInvoiceServiceHeaderDTO arInvoiceDTO)
        {
            ARInvoiceHeader arInvoiceHeader;

            try
            {
                arInvoiceHeader = await _service.AddAsync(arInvoiceDTO);
            }
            catch (Exception ex)
            {
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = arInvoiceDTO.U_RefNum ?? "" } });
            }

            return Ok(new PostResponse { Status = "Success", Message = "Successfully Saved.", Data = new PostResponseData { Id = arInvoiceHeader.Id, U_RefNum = arInvoiceHeader.U_RefNum ?? "" } });
        }

        [HttpGet("status/{id}")]
        public async Task<ActionResult<GetResponse>> GetStatus(Guid id)
        {

            ARInvoiceHeader arInvoice = new ARInvoiceHeader();
            string integStatus = string.Empty;

            try
            {
                arInvoice = await _service.GetStatusAsync(id);

                if (arInvoice == null)
                {
                    return NotFound(new GetResponse { Status = "Error", Message = $"Id [{id}] Not Found.", Data = new GetResponseData { Id = id } });
                }

                switch (arInvoice.IntegrationStatus)
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
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = arInvoice.U_RefNum, Id = id } });
            }

            return Ok(new GetResponse { Status = "Success", Message = "Integration Status Successfully Retrieved.", Data = new GetResponseData { IntegrationStatus = integStatus, IntegrationMessage = arInvoice.IntegrationMessage ?? "", U_RefNum = arInvoice.U_RefNum ?? "", Id = id } });
        }
    }
}
