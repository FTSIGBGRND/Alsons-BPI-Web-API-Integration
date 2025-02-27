using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.DTOs.IncomingPayment
{
    public class IncomingPaymentHeaderDTO
    {
        [Required]
        [MaxLength(15)]
        public string? CardCode { get; set; }

        [MaxLength(100)]
        [Required]
        public string? CardName { get; set; }

        [Required]
        public DateOnly? DocDate { get; set; }

        [Required]
        public string? CashAccnt { get; set; }

        [Required]
        [Column(TypeName = "decimal(19,6)")]
        public decimal? CashSum { get; set; }

        [Required]
        [MaxLength(15)]
        public string? TrsfrAcct { get; set; }

        [Required]
        public DateOnly? TrsfrDate { get; set; }

        [MaxLength(15)]
        public string? TrsfrRef { get; set; }

        [Required]
        [Column(TypeName = "decimal(19,6)")]
        public decimal? TrsfrSum { get; set; }

        [Required]
        [DefaultValue('N')]
        [RegularExpression("^(N|Y)$", ErrorMessage = "Invalid Value. Valid Values are Y and N ( Y - Yes | N - No)!")]
        public char? Canceled { get; set; } = 'N';

        [Required]
        public int? Series { get; set; }

        [MaxLength(30)]
        [Required]
        public string? U_RefNum { get; set; }

        [MaxLength(100)]
        [Required]
        public string? U_FileName { get; set; }

        [Required]
        public List<IncomingPaymentInvoicesDTO> PaymentInvoices { get; set; } = [];

    }
}
