using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using FTSI_Web_API_System_Integration.Models.UserDefined.Retirement;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.Retirement
{
    public class RetirementHeader : RetirementHeaderUDF
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]    
        public  Guid Id { get; set; }
        public int? DocNum { get; set; } // Document Number
        public int? Series { get; set; } // Series
        [MaxLength(10)]
        public string? PeriodCat { get; set; } // Period Category
        public int? FinncPriod { get; set; } // Posting Period
        public DateOnly? PostDate { get; set; } // Posting Date
        public DateOnly? DocDate { get; set; } // Document Date
        public char? DocStatus { get; set; } = 'P'; // Document Status

        public int? TransId { get; set; } // Transaction Number
        [MaxLength(254)]
        public string? Comments { get; set; } // Remarks
        [MaxLength(32)]
        public string? Reference { get; set; } // Reference
        [MaxLength(20)]
        public string? ObjType { get; set; } // Object Type
        [MaxLength(3)]
        public string? Currency { get; set; } // Currency

        [Column(TypeName = "decimal(19, 6)")]
        public decimal? DocRate { get; set; } // Document Rate

        [Column(TypeName = "decimal(19, 6)")]
        public decimal? SysRate { get; set; } // System Rate

        [MaxLength(10)]
        public string? PIndicator { get; set; } // Period Indicator

        [Column(TypeName = "decimal(19, 6)")]
        public decimal? DocTotal { get; set; } // Document Total

        [Column(TypeName = "decimal(19, 6)")]
        public decimal? DocTotalFC { get; set; } // Document Total (FC)

        [Column(TypeName = "decimal(19, 6)")]
        public decimal? DocTotalSy { get; set; } // Document Total (SC)

        public char? DataSource { get; set; } = 'N'; // Data Source

        public int? UserSign { get; set; } // User Signature
        public int? LogInstanc { get; set; } = 0; // Log Instance
        public DateOnly? CreateDate { get; set; } // Create Date
        public int? UserSign2 { get; set; } // Updating User
        public DateOnly? UpdateDate { get; set; } // Date of Update
        [MaxLength(20)]
        public string? TransType { get; set; } = "-1"; // Original Document

        public int? CreatedBy { get; set; } // Original
        [MaxLength(254)]
        public string? JrnlMemo { get; set; } // Journal Remarks
        public DateOnly? AssetDate { get; set; } // Asset Value Date
        public char? CurSource { get; set; } = 'L'; // Base Currency

        [MaxLength(15)]
        public string? DocType { get; set; } = "PL"; // Document Type

        public char? PrjSmarz { get; set; } = 'Y'; // Summarize by Project
        public char? DstRlSmarz { get; set; } = 'Y'; // Summarize by Distribution Rule

        [MaxLength(15)]
        public string? ManDprType { get; set; } // Manual Depreciation Type
        public char? Handwrtten { get; set; } = 'N'; // Manual Numbering

        public DateOnly? CancelDate { get; set; } // Cancelation Date
        [MaxLength(15)]
        public string? DprArea { get; set; } // Depreciation Area
        public int? BPLId { get; set; } // Branch
        [MaxLength(11)]
        public string? BaseRef { get; set; } // Base Reference
        public char? LVARetire { get; set; } = 'N'; // Low Value Asset Retirement

        public int? CancelOpt { get; set; } = '1'; // Cancelation Option
        [MaxLength(100)]
        public string? BPLName { get; set; } // Branch Name
        [MaxLength(32)]
        public string? VatRegNum { get; set; } // VAT Reg. Number
        [MaxLength(2)]
        public string? GdsMovType { get; set; } // Goods Movement Type

        [Required]
        public List<RetirementLines> Lines { get; set; } = [];

        [Required]
        public List<RetirementJournalTransactions> JournalTransactions { get; set; } = [];

        public DateTime CreatedAt { get; set; }
    }
}
