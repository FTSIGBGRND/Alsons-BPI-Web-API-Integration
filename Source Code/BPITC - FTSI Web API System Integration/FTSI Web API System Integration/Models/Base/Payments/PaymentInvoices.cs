using FTSI_Web_API_System_Integration.Models.UserDefined.PaymentUDF;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.Base.Payments
{
    public class PaymentInvoices : PaymentInvoicesUDF
    {
       
        public Guid HeaderId { get; set; }

        [Required]
        public int? LineNum { get; set; }

        [Required]
        public int? InvType { get; set; }

        [Required]
        [Column(TypeName = "decimal(19,6)")]
        public decimal? SumApplied { get; set; }

        public DateTime CreatedAt { get; set; }

    }
}
