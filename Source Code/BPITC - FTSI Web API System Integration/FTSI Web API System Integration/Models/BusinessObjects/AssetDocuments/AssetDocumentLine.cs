using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.AssetDocuments
{
    public class AssetDocumentLine
    {
        public Guid HeaderId { get; set; }

        public int? LineNum { get; set; } // Row Number

        [MaxLength(50)]
        public string? ItemCode { get; set; } // Item Code

        [MaxLength(15)]
        public string? AcctCode { get; set; } // Account Code

        [Column(TypeName = "decimal(19,6)")]
        public decimal? Quantity { get; set; } // Quantity

        [Column(TypeName = "decimal(19,6)")]
        public decimal? LineTotal { get; set; } // Line Total

        [Column(TypeName = "decimal(19,6)")]
        public decimal? TotalFrgn { get; set; } // Line Total (FC)

        [Column(TypeName = "decimal(19,6)")]
        public decimal? TotalSys { get; set; } // Line Total (SC)

        [MaxLength(15)]
        public string? DprArea { get; set; } // Depreciation Area

        [MaxLength(100)]
        public string? Remarks { get; set; } // Remarks

        public int? LogInstanc { get; set; } = 0; // Log Instance

        [MaxLength(50)]
        public string? NewItemCod { get; set; } // New Item Code

        public char? Partial { get; set; } = 'N'; // Partial (single character)

        [Column(TypeName = "decimal(19,6)")]
        public decimal? APC { get; set; } // APC

        [MaxLength(20)]
        public string? NewAstCls { get; set; } // New Asset Class

        [MaxLength(20)]
        public string? ObjType { get; set; } // Object Type

        [MaxLength(4)]
        public string? TransType { get; set; } // Transaction Type

        [MaxLength(8)]
        public string? OcrCode { get; set; } // Distribution Rule

        [MaxLength(8)]
        public string? OcrCode2 { get; set; } // Distribution Rule 2

        [MaxLength(8)]
        public string? OcrCode3 { get; set; } // Distribution Rule 3

        [MaxLength(8)]
        public string? OcrCode4 { get; set; } // Distribution Rule 4

        [MaxLength(8)]
        public string? OcrCode5 { get; set; } // Distribution Rule 5

        [MaxLength(20)]
        public string? Project { get; set; } // Project Code

        public DateTime? CreatedAt { get; set; }

        [ForeignKey("HeaderId")]
        public AssetDocument? AssetDocument { get; set; }
    }
}
