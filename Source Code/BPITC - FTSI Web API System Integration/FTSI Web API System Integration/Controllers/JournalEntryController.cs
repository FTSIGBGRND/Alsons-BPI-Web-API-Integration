using FTSI_Web_API_System_Integration.DTOs;
using FTSI_Web_API_System_Integration.DTOs.Capitalization;
using FTSI_Web_API_System_Integration.DTOs.JournalEntry;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.AssetDocuments;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.JournalEntry;
using FTSI_Web_API_System_Integration.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace FTSI_Web_API_System_Integration.Controllers
{
    [Route("api/journal-entry")]
    [ApiController]
    [Authorize]
    public class JournalEntryController : ControllerBase
    {
        private readonly JournalEntryService _service;

        public JournalEntryController(JournalEntryService service)
        {
            _service = service;
        }

        [HttpPost]
        public async Task<ActionResult<PostResponse>> PostARInvoiceItem([FromBody] AddJournalEntryDTO dto)
        {
            JournalEntry journal;
            try
            {
                journal = await _service.AddJournalEntryAsync(dto);
            }
            catch (Exception ex)
            {
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = dto.U_RefNum ?? "" } });
            }

            return Ok(new PostResponse { Status = "Success", Message = "Successfully Saved.", Data = new PostResponseData { Id = journal.Id, U_RefNum = journal.U_RefNum ?? "" } });
        }


        [HttpGet("status/{id}")]
        public async Task<ActionResult<GetResponse>> GetStatus(Guid id)
        {

            JournalEntry? journal = new JournalEntry();
            string integStatus = string.Empty;

            try
            {
                journal = await _service.GetStatusAsync(id);

                if (journal == null)
                {
                    return NotFound(new GetResponse { Status = "Error", Message = $"Id [{id}] Not Found.", Data = new GetResponseData { Id = id } });
                }

                switch (journal.IntegrationStatus)
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
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = journal?.U_RefNum, Id = id } });
            }

            return Ok(new GetResponse { Status = "Success", Message = "Integration Status Successfully Retrieved.", Data = new GetResponseData { IntegrationStatus = integStatus, IntegrationMessage = journal.IntegrationMessage ?? "", U_RefNum = journal.U_RefNum ?? "", Id = id } });
        }
    }
}
