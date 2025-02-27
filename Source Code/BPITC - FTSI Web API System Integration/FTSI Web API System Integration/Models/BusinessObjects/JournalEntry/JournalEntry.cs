using FTSI_Web_API_System_Integration.Models.UserDefined.JournalEntryUDF;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.JournalEntry
{
    public class JournalEntry : JournalEntryHeaderUDF
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]   
        public Guid Id { get; set; }

        public int? BatchNum { get; set; }

        public int? TransId { get; set; }

        public char? BtfStatus { get; set; }

        [MaxLength(20)]
        public string? TransType { get; set; }

        [MaxLength(11)]
        public string? BaseRef { get; set; }

        public DateOnly? RefDate { get; set; }

        [MaxLength(254)]
        public string? Memo { get; set; }

        [MaxLength(100)]
        public string? Ref1 { get; set; }

        [MaxLength(100)]
        public string? Ref2 { get; set; }

        public int? CreatedBy { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? LocTotal { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? FcTotal { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? SysTotal { get; set; }

        [MaxLength(4)]
        public string? TransCode { get; set; }

        [MaxLength(3)]
        public string? OrignCurr { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? TransRate { get; set; }

        public int? BtfLine { get; set; }

        [MaxLength(3)]
        public string? TransCurr { get; set; }

        [MaxLength(20)]
        public string? Project { get; set; }

        public DateOnly? DueDate { get; set; }

        public DateOnly? TaxDate { get; set; }

        public char? PCAddition { get; set; }

        public int? FinncPriod { get; set; }

        public char? DataSource { get; set; }

        public DateOnly? UpdateDate { get; set; }

        public DateOnly? CreateDate { get; set; }

        public int? UserSign { get; set; }

        public int? UserSign2 { get; set; }

        public char? RefndRprt { get; set; }

        public int? LogInstanc { get; set; }

        [MaxLength(20)]
        public string? ObjType { get; set; }

        [MaxLength(2)]
        public string? Indicator { get; set; }

        public char? AdjTran { get; set; }

        public char? RevSource { get; set; }

        public DateOnly? StornoDate { get; set; }

        public int? StornoToTr { get; set; }

        public char? AutoStorno { get; set; }

        public char? Corisptivi { get; set; }

        public DateOnly? VatDate { get; set; }

        public char? StampTax { get; set; }

        public int? Series { get; set; }

        public int? Number { get; set; }

        public char? AutoVAT { get; set; }

        public int? DocSeries { get; set; }

        [MaxLength(4)]
        public string? FolioPref { get; set; }

        public int? FolioNum { get; set; }

        public int? CreateTime { get; set; }

        public char? BlockDunn { get; set; }

        public char? ReportEU { get; set; }

        public char? Report347 { get; set; }

        public char? Printed { get; set; }

        [MaxLength(60)]
        public string? DocType { get; set; }

        public int? AttNum { get; set; }

        public char? GenRegNo { get; set; }

        public int? RG23APart2 { get; set; }

        public int? RG23CPart2 { get; set; }

        public int? MatType { get; set; }

        [MaxLength(155)]
        public string? Creator { get; set; }

        [MaxLength(155)]
        public string? Approver { get; set; }

        public int? Location { get; set; }

        public int? SeqCode { get; set; }

        public int? Serial { get; set; }

        [MaxLength(3)]
        public string? SeriesStr { get; set; }

        [MaxLength(3)]
        public string? SubStr { get; set; }

        public char? AutoWT { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTSum { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTSumSC { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTSumFC { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTApplied { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTAppliedS { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? WTAppliedF { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BaseAmnt { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BaseAmntSC { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BaseAmntFC { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BaseVtAt { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BaseVtAtSC { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? BaseVtAtFC { get; set; }

        [MaxLength(13)]
        public string? VersionNum { get; set; }

        public int? BaseTrans { get; set; }

        public char? ResidenNum { get; set; }

        public char? OperatCode { get; set; }

        [MaxLength(100)]
        public string? Ref3 { get; set; }

        public char? SSIExmpt { get; set; }

        [MaxLength(16)]
        public string? SignMsg { get; set; }

        [MaxLength(16)]
        public string? SignDigest { get; set; }

        [MaxLength(50)]
        public string? CertifNum { get; set; }

        public int? KeyVersion { get; set; }

        public int? CUP { get; set; }

        public int? CIG { get; set; }

        [MaxLength(254)]
        public string? SupplCode { get; set; }

        public int? SPSrcType { get; set; }

        public int? SPSrcID { get; set; }

        public int? SPSrcDLN { get; set; }

        public char? DeferedTax { get; set; }

        public int? AgrNo { get; set; }

        public int? SeqNum { get; set; }

        public char? ECDPosTyp { get; set; }

        [MaxLength(5)]
        public string? RptPeriod { get; set; }

        public DateOnly? RptMonth { get; set; }

        public int? ExTransId { get; set; }

        public char? PrlLinked { get; set; }

        [MaxLength(5)]
        public string? PTICode { get; set; }

        public char? Letter { get; set; }

        public int? FolNumFrom { get; set; }

        public int? FolNumTo { get; set; }

        [MaxLength(3)]
        public string? RepSection { get; set; }

        public char? ExclTaxRep { get; set; }

        public char? IsCoEntry { get; set; }

        [MaxLength(16)]
        public string? SAPPassprt { get; set; }

        public int? AtcEntry { get; set; }

        [MaxLength(16)]
        public string? Attachment { get; set; }

        public char? EBookable { get; set; }

        public int? DataVers { get; set; }

        public DateTime? CreatedAt { get; set; }

        public List<JournalEntryLine>? Lines { get; set; } = [];
    }

}
