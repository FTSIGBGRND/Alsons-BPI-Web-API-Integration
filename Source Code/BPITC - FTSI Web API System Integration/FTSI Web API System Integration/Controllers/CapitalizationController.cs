using FTSI_Web_API_System_Integration.DTOs;
using FTSI_Web_API_System_Integration.DTOs.Capitalization;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.AssetDocuments;
using FTSI_Web_API_System_Integration.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace FTSI_Web_API_System_Integration.Controllers
{
    [Route("api/fixed-asset")]
    [ApiController]
    [Authorize]
    public class CapitalizationController : ControllerBase
    {
        private readonly FixedAssetService _service;

        public CapitalizationController(FixedAssetService service)
        {
            _service = service;
        }

        // POST api/<ARInvoiceController>
        [HttpPost]
        public async Task<ActionResult<PostResponse>> PostARInvoiceItem([FromBody] AddFixedAssetDTO dto)
        {
            AssetDocument assetHeader;

            try
            {
                assetHeader = await _service.AddFixedAssetAsync(dto);
            }
            catch (Exception ex)
            {
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = dto.U_RefNum ?? "" } });
            }

            return Ok(new PostResponse { Status = "Success", Message = "Successfully Saved.", Data = new PostResponseData { Id = assetHeader.Id, U_RefNum = assetHeader.U_RefNum ?? "" } });
        }


        [HttpGet("status/{id}")]
        public async Task<ActionResult<GetResponse>> GetStatus(Guid id)
        {

            AssetDocument? assetDoc = new AssetDocument();
            string integStatus = string.Empty;

            try
            {
                assetDoc = await _service.GetStatusAsync(id);

                if (assetDoc == null)
                {
                    return NotFound(new GetResponse { Status = "Error", Message = $"Id [{id}] Not Found.", Data = new GetResponseData { Id = id } });
                }

                switch (assetDoc.IntegrationStatus)
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
                return BadRequest(new PostResponse { Status = "Error", Message = ex.Message, Data = new PostResponseData { U_RefNum = assetDoc?.U_RefNum, Id = id } });
            }

            return Ok(new GetResponse { Status = "Success", Message = "Integration Status Successfully Retrieved.", Data = new GetResponseData { IntegrationStatus = integStatus, IntegrationMessage = assetDoc.IntegrationMessage ?? "", U_RefNum = assetDoc.U_RefNum ?? "", Id = id } });
        }
    }
}
