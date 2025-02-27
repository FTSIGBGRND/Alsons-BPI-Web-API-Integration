using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace FTSI_Web_API_System_Integration.Models.UserDefined.JournalEntryUDF
{
    public class JournalEntryLineUDF
    {
        public DateOnly? U_InvDate { get; set; }

        [MaxLength(20)]
        public string? U_InvNum { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? U_VatBase { get; set; }

        [MaxLength(20)]
        public string? U_TransType { get; set; }

        [MaxLength(10)]
        public string? U_xWTCode { get; set; }

        [MaxLength(20)]
        public string? U_xWTVendor { get; set; }

        [MaxLength(100)]
        public string? U_xSupplierName { get; set; }

        [MaxLength(100)]
        public string? U_xCardTyp { get; set; }

        [MaxLength(254)]
        public string? U_Address { get; set; }

        [MaxLength(20)]
        public string? U_TIN { get; set; }

        [MaxLength(20)]
        public string? U_TIN1 { get; set; }

        [MaxLength(20)]
        public string? U_TIN2 { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? U_TaxAmt { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        public decimal? U_TaxableAmt { get; set; }

        [MaxLength(20)]
        public string? U_SrceDocNo { get; set; }

        [MaxLength(20)]
        public string? U_ORNo { get; set; }

        [MaxLength(20)]
        public string? U_SOA { get; set; }

        [MaxLength(20)]
        public string? U_CheckNo { get; set; }

        public DateOnly? U_CheckDate { get; set; }

        [MaxLength(20)]
        public string? U_APVNo { get; set; }

        [MaxLength(20)]
        public string? U_VSIRefNo { get; set; }

        [MaxLength(30)]
        public string? U_Contract { get; set; }

        [Required]
        [DefaultValue('C')]
        public char CardType { get; set; } = 'C';

        [Required]
        public int? GroupNum { get; set; }

        [DefaultValue('N')]
        public char? WTLiable { get; set; } = 'N';

        [MaxLength(100)]
        public string? E_mail { get; set; }

        [MaxLength(50)]
        public string? Phone1 { get; set; }

        [MaxLength(90)]
        public string? CntctPrsn { get; set; }
    }
}
