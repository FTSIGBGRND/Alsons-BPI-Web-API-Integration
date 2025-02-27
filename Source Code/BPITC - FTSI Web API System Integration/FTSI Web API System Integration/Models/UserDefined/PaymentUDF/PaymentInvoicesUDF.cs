using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.UserDefined.PaymentUDF
{
    public class PaymentInvoicesUDF
    {
        [MaxLength(30)]
        public string? U_RefNum { get; set; }
    }
}
