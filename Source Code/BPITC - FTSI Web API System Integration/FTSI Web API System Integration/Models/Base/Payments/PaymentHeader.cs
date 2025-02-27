using FTSI_Web_API_System_Integration.Models.UserDefined.PaymentUDF;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.Base.Payments
{
    public class PaymentHeader : PaymentHeaderUDF
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid Id { get; set; }

        public int? DocNum { get; set; }

        [Required]
        [MaxLength(15)]
        public string? CardCode { get; set; }

        [MaxLength(100)]
        public string? CardName { get; set; }

        public DateOnly? DocDate { get; set; }

        public string? CashAccnt { get; set; }

        [Required]
        [Column(TypeName = "decimal(19,6)")]
        public decimal? CashSum { get; set; }

        [Required]
        [MaxLength(15)]
        public string? TrsfrAcct { get; set; }

        public DateOnly? TrsfrDate { get; set; }

        [MaxLength(15)]
        public string? TrsfrRef { get; set; }

        [Required]
        [Column(TypeName = "decimal(19,6)")]
        public decimal? TrsfrSum { get; set; }

        public char? Canceled { get; set; } = 'N';

        public int? Series { get; set; }

        public DateTime CreatedAt { get; set; }

    }
}
