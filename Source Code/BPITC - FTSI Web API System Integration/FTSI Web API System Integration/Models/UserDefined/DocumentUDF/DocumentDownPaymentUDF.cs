using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.Models.UserDefined.DocumentUDF
{
    public class DocumentDownPaymentUDF
    {
        [MaxLength(30)]
        public string? U_RefNum { get; set; }

        [MaxLength(30)]
        public string? U_DPRefNum { get; set; }
    }
}
