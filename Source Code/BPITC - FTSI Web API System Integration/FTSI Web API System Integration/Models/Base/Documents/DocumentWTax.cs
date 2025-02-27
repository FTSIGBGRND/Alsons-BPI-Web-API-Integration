using FTSI_Web_API_System_Integration.Models.UserDefined.DocumentUDF;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.Base.Document
{
    public class DocumentWTax : DocumentWTaxUDF
    {

        public Guid HeaderId { get; set; }

        [Required]
        public int LineNum { get; set; } = 0;

        [MaxLength(4)]
        public string? WTCode { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? TaxbleAmnt { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTAmnt { get; set; }

        public DateTime CreatedAt { get; set; }

    }
}
