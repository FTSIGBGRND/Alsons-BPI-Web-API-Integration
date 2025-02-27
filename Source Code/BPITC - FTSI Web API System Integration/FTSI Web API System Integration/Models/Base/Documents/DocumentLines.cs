using FTSI_Web_API_System_Integration.Models.UserDefined.DocumentUDF;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.Base.Document
{
    public class DocumentLines : DocumentLinesUDF
    {

        public Guid HeaderId { get; set; }

        [Required]
        public int? LineNum { get; set; }
        public int? BaseType { get; set; }
        public int? BaseEntry { get; set; }
        public int? BaseRef { get; set; }
        public int? BaseLine { get; set; }

        [MaxLength(50)]
        public string? ItemCode { get; set; }

        [MaxLength(200)]
        public string? Description { get; set; }

        [MaxLength(15)]
        public string? AccountCode { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? DiscPrcnt { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? Quantity { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? Price { get; set; }

        [MaxLength(8)]
        public string? VatGroup { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? PriceAfVAT { get; set; }
        public string? WTLiable { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? LineTotal { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? GrossTotal { get; set; }

        [MaxLength(8)]
        public string? OcrCode { get; set; }

        [MaxLength(8)]
        public string? OcrCode2 { get; set; }

        [MaxLength(8)]
        public string? OcrCode3 { get; set; }

        [MaxLength(8)]
        public string? OcrCode4 { get; set; }

        [MaxLength(8)]
        public string? OcrCode5 { get; set; }

        public DateTime CreatedAt { get; set; }

    }
}
