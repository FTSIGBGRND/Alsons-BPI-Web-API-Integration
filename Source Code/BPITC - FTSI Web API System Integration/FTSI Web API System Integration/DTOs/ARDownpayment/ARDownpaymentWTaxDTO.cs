using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.DTOs.ARDownpayment
{
    public class ARDownpaymentWTaxDTO
    {
        [MaxLength(4, ErrorMessage = "Withholding Tax Code cannot exceed 4 characters!")]
        public string? WTCode { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? TaxbleAmnt { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTAmnt { get; set; }

        [MaxLength(30, ErrorMessage = "Document Tax Reference Number cannot exceed 30 characters!")]
        public string? U_RefNum { get; set; }
    }
}
