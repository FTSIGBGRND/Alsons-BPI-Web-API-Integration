using FTSI_Web_API_System_Integration.Helpers;
using FTSI_Web_API_System_Integration.Models.UserDefined.AssetDocument;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.AssetDocuments
{
    public class AssetDocument : AssetDocumentUDF
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid Id { get; set; }

        public int? DocNum { get; set; }

        public int? Series { get; set; }

        [MaxLength(10)]
        public string? PeriodCat { get; set; }

        public int? FinncPeroid { get; set; }

        public DateOnly? PostDate { get; set; }

        public DateOnly? DocDate { get; set; }

        public char? DocStatus { get; set; } = Helpers.DocStatus.Posted;

        public int? TransId { get; set; }

        [MaxLength(254)]
        public string? Comments { get; set; }

        [MaxLength(32)]
        public string? Reference { get; set; }

        [MaxLength(20)]
        public string? ObjType { get; set; }

        [MaxLength(3)]
        public string? Currency { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? DocRate { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? SysRate { get; set; } // System Rate

        [MaxLength(10)]
        public string? PIndicator { get; set; } // Period Indicator

        [Column(TypeName = "decimal(19,6)")]
        public decimal? DocTotal { get; set; } // Document Total

        [Column(TypeName = "decimal(19,6)")]
        public decimal? DocTotalFC { get; set; } // Document Total (FC)

        [Column(TypeName = "decimal(19,6)")]
        public decimal? DocTotalSy { get; set; } // Document Total (SC)

        public char? DataSource { get; set; } = Helpers.DataSource.Unknown;  // Data Source (single character)

        public int? UserSign { get; set; } // User Signature

        public int? LogInstanc { get; set; } = 0; // Log Instance

        public DateOnly? CreateDate { get; set; } // Create Date

        public int? UserSign2 { get; set; } // Updating User

        public DateOnly? UpdateDate { get; set; } // Date of Update

        [MaxLength(20)]
        public string? TransType { get; set; } = Helpers.TransType.AllTransactions; // Original Document

        public int? CreatedBy { get; set; } // Original

        [MaxLength(254)]
        public string? JrnlMemo { get; set; } // Journal Remarks

        public DateOnly? AssetDate { get; set; } // Asset Value Date

        public char? CurSource { get; set; } = 'L'; // Base Currency (single character)

        [MaxLength(15)]
        public string? DocType { get; set; } = "PL"; // Document Type

        public char? PrjSmarz { get; set; } = 'N'; // Summarize by Project (single character)

        public char? DstRlSmarz { get; set; } = 'N'; // Summarize by Distribution Rule (single character)

        [MaxLength(15)]
        public string? ManDprType { get; set; } // Manual Depreciation Type

        public char? Handwrtten { get; set; } = 'N'; // Manual Numbering (single character)

        public DateOnly? CancelDate { get; set; } // Cancelation Date

        [MaxLength(15)]
        public string? DprArea { get; set; } // Depreciation Area

        public int? BPLId { get; set; } // Branch

        [MaxLength(11)]
        public string? BaseRef { get; set; } // Base Reference

        public char? LVARetire { get; set; } = 'N'; // Low Value Asset Retirement (single character)

        public int? CancelOpt { get; set; } = 1; // Cancelation Option

        [MaxLength(100)]
        public string? BPLName { get; set; } // Branch Name

        [MaxLength(32)]
        public string? VatRegNum { get; set; } // VAT Reg. Number

        [MaxLength(2)]
        public string? GdsMovType { get; set; } // Goods Movement Type

        public DateTime? CreatedAt { get; set; }

        public List<AssetDocumentLine> AssetDocumentLines { get; set; } = [];
    }
}
