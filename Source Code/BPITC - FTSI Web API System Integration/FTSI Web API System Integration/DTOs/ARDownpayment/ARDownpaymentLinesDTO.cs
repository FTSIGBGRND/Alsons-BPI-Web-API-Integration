using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace FTSI_Web_API_System_Integration.DTOs.ARDownpayment
{
    public class ARDownpaymentLinesDTO
    {
        [Required]
        public int LineNum { get; set; }
        public int? U_BaseType { get; set; }
        [MaxLength(255)]
        public string? U_BaseRef { get; set; }
        public int? U_BaseLine { get; set; }

        [MaxLength(50, ErrorMessage = "ItemCode cannot exceed 50 characters!")]
        [Required]
        public string ItemCode { get; set; }

        [MaxLength(200, ErrorMessage = "Description cannot exceed 200 characters!")]
        public string? Description { get; set; }

        [MaxLength(15, ErrorMessage = "Account Code cannot exceed 15 characters!")]
        [Required]
        public string? AccountCode { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? DiscPrcnt { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? Quantity { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? Price { get; set; }

        [MaxLength(4, ErrorMessage = "Account Code cannot exceed 8 characters!")]
        [Required]
        public string? VatGroup { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        [Required]
        public decimal? PriceAfVAT { get; set; }

        [RegularExpression("^(N|Y)$", ErrorMessage = "Invalid Value. Withholding Tax Liable Valid Values are Y and N (Y - Yes | N - No)!")]
        [DefaultValue("N")]
        public string? WTLiable { get; set; }

        //[Column(TypeName = "decimal(19,6)")]
        //public decimal? LineTotal { get; set; }

        //[Column(TypeName = "decimal(19,6)")]
        //public decimal? GrossTotal { get; set; }

        [MaxLength(8, ErrorMessage = "Cost Center Code Dimension 1 cannot exceed 8 characters!")]
        public string? OcrCode { get; set; }

        [MaxLength(8, ErrorMessage = "Cost Center Code Dimension 2 cannot exceed 8 characters!")]
        public string? OcrCode2 { get; set; }

        [MaxLength(8, ErrorMessage = "Cost Center Code Dimension 3 cannot exceed 8 characters!")]
        public string? OcrCode3 { get; set; }

        [MaxLength(8, ErrorMessage = "Cost Center Code Dimension 4 cannot exceed 8 characters!")]
        public string? OcrCode4 { get; set; }

        [MaxLength(8, ErrorMessage = "Cost Center Code Dimension 5 cannot exceed 8 characters!")]
        public string? OcrCode5 { get; set; }

        [MaxLength(30, ErrorMessage = "Document Line Reference Number cannot exceed 30 characters!")]
        public string? U_RefNum { get; set; }

        public string? U_LongDscrptn { get; set; }

        [MaxLength(10)]
        public string? U_Period { get; set; }
    }
}
