using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.DTOs.IncomingPayment
{
    public class IncomingPaymentInvoicesDTO
    {
        public int? LineNum { get; set; }

        [Required]
        public int? InvType { get; set; }

        [Required]
        [Column(TypeName = "decimal(19,6)")]
        public decimal? SumApplied { get; set; }

        [Required]
        [MaxLength(30)]
        public string? U_RefNum { get; set; }
    }
}
