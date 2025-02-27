using FTSI_Web_API_System_Integration.DTOs;
using FTSI_Web_API_System_Integration.DTOs.ARDownpayment;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARDownPayment;
using FTSI_Web_API_System_Integration.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace FTSI_Web_API_System_Integration.Controllers
{
    [Route("api/documents/ardownpayment")]
    [ApiController]
    [Authorize]
    public class ARDownpaymentController : ControllerBase
    {
        private readonly ARDownpaymentService _service;

        public ARDownpaymentController(ARDownpaymentService service)
        {
            _service = service;
        }

        [HttpPost]
        public async Task<ActionResult<PostResponse>> Post([FromBody] ARDownpaymentHeaderDTO dto)
        {
            ARDownpaymentHeader header;

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

            ARDownpaymentHeader header = new ();
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
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = header.U_RefNum, Id = id } });
            }

            return Ok(new GetResponse { Status = "Success", Message = "Integration Status Successfully Retrieved.", Data = new GetResponseData { IntegrationStatus = integStatus, IntegrationMessage = header.IntegrationMessage ?? "", U_RefNum = header.U_RefNum ?? "", Id = id } });
        }
    }

}
