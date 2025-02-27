using FTSI_Web_API_System_Integration.DTOs;
using FTSI_Web_API_System_Integration.DTOs.ARInvoice;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice;
using FTSI_Web_API_System_Integration.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace FTSI_Web_API_System_Integration.Controllers
{
    [Route("api/documents/apinvoice")]
    [ApiController]
    [Authorize]
    public class APInvoiceController : ControllerBase
    {
        private readonly APInvoiceService _service;

        public APInvoiceController(APInvoiceService service)
        {
            _service = service;
        }

        // POST api/<ARInvoiceController>
        [HttpPost("item")]
        public async Task<ActionResult<PostResponse>> PostItem([FromBody] APInvoiceItemHeaderDTO invoiceDTO)
        {
            APInvoiceHeader header;

            try
            {
                header = await _service.AddAsync(invoiceDTO);
            }
            catch (Exception ex)
            {
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = invoiceDTO.U_RefNum ?? "" } });
            }

            return Ok(new PostResponse { Status = "Success", Message = "Successfully Saved.", Data = new PostResponseData { Id = header.Id, U_RefNum = header.U_RefNum ?? "" } });
        }

        // POST api/<ARInvoiceController>
        [HttpPost("service")]
        public async Task<ActionResult<PostResponse>> PostService([FromBody] APInvoiceServiceHeaderDTO invoiceDTO)
        {
            APInvoiceHeader header;

            try
            {
                header = await _service.AddAsync(invoiceDTO);
            }
            catch (Exception ex)
            {
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = invoiceDTO.U_RefNum ?? "" } });
            }

            return Ok(new PostResponse { Status = "Success", Message = "Successfully Saved.", Data = new PostResponseData { Id = header.Id, U_RefNum = header.U_RefNum ?? "" } });
        }

        [HttpGet("status/{id}")]
        public async Task<ActionResult<GetResponse>> GetStatus(Guid id)
        {

            APInvoiceHeader invoice = new APInvoiceHeader();
            string integStatus = string.Empty;

            try
            {
                invoice = await _service.GetStatusAsync(id);

                if (invoice == null)
                {
                    return NotFound(new GetResponse { Status = "Error", Message = $"Id [{id}] Not Found.", Data = new GetResponseData { Id = id } });
                }

                switch (invoice.IntegrationStatus)
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
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = invoice.U_RefNum, Id = id } });
            }

            return Ok(new GetResponse { Status = "Success", Message = "Integration Status Successfully Retrieved.", Data = new GetResponseData { IntegrationStatus = integStatus, IntegrationMessage = invoice.IntegrationMessage ?? "", U_RefNum = invoice.U_RefNum ?? "", Id = id } });
        }
    }
}
