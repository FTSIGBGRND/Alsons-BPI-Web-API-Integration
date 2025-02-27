using FTSI_Web_API_System_Integration.Models.UserDefined.JournalEntryUDF;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.JournalEntry
{
    public class JournalEntryLine : JournalEntryLineUDF
    {
        public Guid HeaderId { get; set; }

        public int? TransId { get; set; } // Transaction Key

        public int? LineId { get; set; } // Row Number

        [MaxLength(15)]
        public string? Account { get; set; } // Account Code

        [Column(TypeName = "decimal(19,6)")]
        public decimal? Debit { get; set; } // Debit Amount

        [Column(TypeName = "decimal(19,6)")]
        public decimal? Credit { get; set; } // Credit Amount

        [Column(TypeName = "decimal(19,6)")]
        public decimal? SYSCred { get; set; } // System Credit Amount

        [Column(TypeName = "decimal(19,6)")]
        public decimal? SYSDeb { get; set; } // System Debit Amount

        [Column(TypeName = "decimal(19,6)")]
        public decimal? FCDebit { get; set; } // Debit Amount (FC)

        [Column(TypeName = "decimal(19,6)")]
        public decimal? FCCredit { get; set; } // Credit Amount (FC)

        [MaxLength(3)]
        public string? FCCurrency { get; set; } // Foreign Currency

        public DateOnly? DueDate { get; set; } // Due Date

        public int? SourceID { get; set; } // Source Key

        public int? SourceLine { get; set; } // Source Row Number

        [MaxLength(15)]
        public string? ShortName { get; set; } // BP/Account Code

        public int? IntrnMatch { get; set; } // Internal Reconciliation No.

        public int? ExtrMatch { get; set; } // External Reconciliation No.

        [MaxLength(15)]
        public string? ContraAct { get; set; } // Offset Account

        [MaxLength(254)]
        public string? LineMemo { get; set; } // Row Details

        [MaxLength(100)]
        public string? Ref3Line { get; set; } // Reference 3

        [MaxLength(20)]
        public string? TransType { get; set; } // Original Journal

        public DateOnly? RefDate { get; set; } // Posting Date

        public DateOnly? Ref2Date { get; set; } // Posting Date 3

        [MaxLength(100)]
        public string? Ref1 { get; set; } // Reference 1

        [MaxLength(100)]
        public string? Ref2 { get; set; } // Reference 2

        public int? CreatedBy { get; set; } // Origin

        [MaxLength(11)]
        public string? BaseRef { get; set; } // Base Reference

        [MaxLength(20)]
        public string? Project { get; set; } // Project Code

        [MaxLength(4)]
        public string? TransCode { get; set; } // Transaction Code

        [MaxLength(8)]
        public string? ProfitCode { get; set; } // Distribution Rule

        public DateOnly? TaxDate { get; set; } // Document Date

        [Column(TypeName = "decimal(19,6)")]
        public decimal? SystemRate { get; set; } // System Price

        public DateOnly? MthDate { get; set; } // Reconciliation Date

        [Column(TypeName = "decimal(19,6)")]
        public decimal? ToMthSum { get; set; } // Reconciliation Total

        public int? UserSign { get; set; } // User Signature

        public int? BatchNum { get; set; } // Journal Voucher No.

        public int? FinncPriod { get; set; } // Posting Period

        public int? RelTransId { get; set; } // Linked Transaction Key

        public int? RelLineID { get; set; } // Linked Row No.

        public char? RelType { get; set; } // Link Type

        public int? LogInstanc { get; set; } // Log Instance

        [MaxLength(8)]
        public string? VatGroup { get; set; } // Tax Group

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BaseSum { get; set; } // Base Amount

        [Column(TypeName = "decimal(19,6)")]
        public decimal? VatRate { get; set; } // Tax %

        [MaxLength(2)]
        public string? Indicator { get; set; } // Indicator Code


        public char? AdjTran { get; set; } // Adjusting Trans. (Period 13)


        public char? RevSource { get; set; } // Revaluation Source

        [MaxLength(20)]
        public string? ObjType { get; set; } // Object Type

        public DateOnly? VatDate { get; set; } // Document Date

        [MaxLength(27)]
        public string? PaymentRef { get; set; } // Payment Reference No.

        [Column(TypeName = "decimal(19,6)")]
        public decimal? SYSBaseSum { get; set; } // System Base Amount

        public int? MultMatch { get; set; } // Multiple BP Reconciliation No.

        public char? VatLine { get; set; } // VAT Row

        [Column(TypeName = "decimal(19,6)")]
        public decimal? VatAmount { get; set; } // VAT Amount

        [Column(TypeName = "decimal(19,6)")]
        public decimal? SYSVatSum { get; set; } // System VAT Amount


        public char? Closed { get; set; } // Closed

        [Column(TypeName = "decimal(19,6)")]
        public decimal? GrossValue { get; set; } // Gross Value

        public int? CheckAbs { get; set; } // Internal Check Number

        public int? LineType { get; set; } // Line Type


        public char? DebCred { get; set; } // Debit Credit Line Indicator

        public int? SequenceNr { get; set; } // Assigned Sequence No.

        [MaxLength(15)]
        public string? StornoAcc { get; set; } // Storno Account Code

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BalDueDeb { get; set; } // Balance Due - Debit

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BalDueCred { get; set; } // Balance Due - Credit

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BalFcDeb { get; set; } // Balance Due (FC) - Debit

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BalFcCred { get; set; } // Balance Due (FC) - Credit

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BalScDeb { get; set; } // Balance Due (SC) - Debit

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BalScCred { get; set; } // Balance Due (SC) - Credit


        public char? IsNet { get; set; } // Use Net Amount


        public char? DunWizBlck { get; set; } // Wizard Dunning Block

        public int? DunnLevel { get; set; } // Dunning Level

        public DateOnly? DunDate { get; set; } // Last Dunning Date

        public int? TaxType { get; set; } // Tax Type


        public char? TaxPostAcc { get; set; } // Tax Posting Account

        [MaxLength(8)]
        public string? StaCode { get; set; } // Authority Code

        public int? StaType { get; set; } // Authority Type

        [MaxLength(8)]
        public string? TaxCode { get; set; } // Tax Code

        public DateOnly? ValidFrom { get; set; } // Valid From

        [Column(TypeName = "decimal(19,6)")]
        public decimal? GrossValFc { get; set; } // Gross Value (FC)

        public DateOnly? LvlUpdDate { get; set; } // Dunning Level Update Date

        [MaxLength(8)]
        public string? OcrCode2 { get; set; } // Costing Code 2

        [MaxLength(8)]
        public string? OcrCode3 { get; set; } // Costing Code 3

        [MaxLength(8)]
        public string? OcrCode4 { get; set; } // Costing Code 4

        [MaxLength(8)]
        public string? OcrCode5 { get; set; } // Costing Code 5

        public int? MIEntry { get; set; } // MI Entry when include this OB

        public int? MIVEntry { get; set; } // A/P Monthly Invoice

        public int? ClsInTP { get; set; } // Tax Payment Wizard

        public int? CenVatCom { get; set; } // CENVAT Component

        public int? MatType { get; set; } // Material Type

        public int? PstngType { get; set; } // Posting Type

        public DateOnly? ValidFrom2 { get; set; } // Valid from2

        public DateOnly? ValidFrom3 { get; set; } // Valid from3

        public DateOnly? ValidFrom4 { get; set; } // Valid from4

        public DateOnly? ValidFrom5 { get; set; } // Valid from5

        public int? Location { get; set; } // Loc.

        [MaxLength(4)]
        public string? WTaxCode { get; set; } // Withholding Tax Code

        [Column(TypeName = "decimal(19,6)")]
        public decimal? EquVatRate { get; set; } // Equalization Tax %

        [Column(TypeName = "decimal(19,6)")]
        public decimal? EquVatSum { get; set; } // Equalization Tax Amount

        [Column(TypeName = "decimal(19,6)")]
        public decimal? SYSEquSum { get; set; } // System Equalization Tax Amount

        [Column(TypeName = "decimal(19,6)")]
        public decimal? TotalVat { get; set; } // Total Tax

        [Column(TypeName = "decimal(19,6)")]
        public decimal? SYSTVat { get; set; } // System Total Tax

        public char? WTLiable { get; set; } // WTax-Liable

        public char? WTLine { get; set; } // WTax Row

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTApplied { get; set; } // Applied WTax

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTAppliedS { get; set; } // Applied WTax (SC)

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTAppliedF { get; set; } // Applied WTax (FC)

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTSum { get; set; } // WTax Amount

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTSumFC { get; set; } // WTax Amount (FC)

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTSumSC { get; set; } // WTax Amount (SC)

        public char? PayBlock { get; set; } // Payment Block

        public int? PayBlckRef { get; set; } // Payment Block Abs Entry

        [MaxLength(32)]
        public string? LicTradNum { get; set; } // Federal Tax ID

        public int? InterimTyp { get; set; } // Interim Account Type

        public int? DprId { get; set; } // Down Payment Request Key

        [MaxLength(20)]
        public string? MatchRef { get; set; } // Reconciliation Reference

        public char? Ordered { get; set; } // Payment Ordered

        public int? CUP { get; set; } // Unique Code of Project

        public int? CIG { get; set; } // Contract Code Identification

        public int? BPLId { get; set; } // Branch

        [MaxLength(100)]
        public string? BPLName { get; set; } // Branch Name

        [MaxLength(32)]
        public string? VatRegNum { get; set; } // VAT Reg. Number

        public char? SLEDGERF { get; set; } // Subledger Flag

        [MaxLength(100)]
        public string? InitRef2 { get; set; } // Initial Reference 2

        [MaxLength(27)]
        public string? InitRef3Ln { get; set; } // Initial Reference 3

        [MaxLength(50)]
        public string? ExpUUID { get; set; } // Expense UUID

        public char? ExpOPType { get; set; } // Expense Operation Type

        public int? ExTransId { get; set; } // Exposed Transaction ID

        public int? DocArr { get; set; } // Source of Posting

        public int? DocLine { get; set; } // Source Line Internal ID

        [MaxLength(2)]
        public string? MYFtype { get; set; } // MYF type

        public int? DocEntry { get; set; } // Source Document Entry

        public int? DocNum { get; set; } // Source Document Number

        [MaxLength(20)]
        public string? DocType { get; set; } // Source Document Type

        [MaxLength(2)]
        public string? DocSubType { get; set; } // Document Subtype

        public int? RmrkTmpt { get; set; } // Remark Text Template

        [MaxLength(20)]
        public string? CemCode { get; set; } // Cost Element Code

        public int? InClassCat { get; set; } // Income Classification Category

        public int? InClassTyp { get; set; } // Income Classification Type

        public int? ExClassCat { get; set; } // Expense Classification Category

        public int? ExClassTyp { get; set; } // Expense Classification Type

        public int? VATClassCa { get; set; } // VAT Classification Category

        public int? VATClassTy { get; set; } // VAT Classification Type

        public int? EVatCate { get; set; } // VAT Category

        public int? EWtPercCat { get; set; } // Withheld Percentage Category

        [Column(TypeName = "decimal(19,6)")]
        public decimal? EWtAmount { get; set; } // Withheld Amount

        public int? EBVatExCau { get; set; } // VAT Exemption Cause

        public DateTime? CreatedAt { get; set; }

        [ForeignKey(nameof(HeaderId))]
        public JournalEntry? JournalEntry { get; set; }

    }
}
