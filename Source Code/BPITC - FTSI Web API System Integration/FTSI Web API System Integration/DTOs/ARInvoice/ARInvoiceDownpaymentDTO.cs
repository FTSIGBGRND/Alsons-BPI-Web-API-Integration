using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.DTOs.ARInvoice
{
    public class ARInvoiceDownpaymentDTO
    {

        [Required]
        public int? LineNum { get; set; }

        [Required]
        [Column(TypeName = "decimal(19,6)")]
        public decimal? DrawnSum { get; set; }

        [Required]
        [MaxLength(30)]
        public string? U_RefNum  { get; set; }

        [Required]
        [MaxLength(30)]
        public string? U_DPRefNum { get; set; }

    }
}
