using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.DTOs.JournalEntry
{
    public class AddJournalEntryLinesDTO
    {

        [MaxLength(15)]
        [Required]
        public string? ShortName { get; set; } // BP/Account Code

        [MaxLength(15)]
        [Required]
        public string? Account { get; set; } // Account Code
        [MaxLength(20)]
        [Required]
        public string? U_DocNum { get; set; }

        [MaxLength(254)]
        [Required]
        public string? LineMemo { get; set; } // Row Details


        [Column(TypeName = "decimal(19,6)")]
        [Required]
        public decimal? Debit { get; set; } // Debit Amount

        [Column(TypeName = "decimal(19,6)")]
        [Required]
        public decimal? Credit { get; set; } // Credit Amount


        [MaxLength(3)]
        [Required]
        public string? FCCurrency { get; set; } // Foreign Currency


        [MaxLength(8)]
        public string? ProfitCode { get; set; } // Distribution Rule


        [MaxLength(8)]
        public string? OcrCode2 { get; set; } // Costing Code 2

        [MaxLength(8)]
        public string? OcrCode3 { get; set; } // Costing Code 3

        [MaxLength(8)]
        public string? OcrCode4 { get; set; } // Costing Code 4

        [MaxLength(8)]
        public string? OcrCode5 { get; set; } // Costing Code 5

        [Required]
        public DateOnly? U_InvDate { get; set; }

        [MaxLength(20)]
        [Required]
        public string? U_InvNum { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        [Required]
        public decimal? U_VatBase { get; set; }

        [MaxLength(20)]
        [Required]
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
        [Required]
        public decimal? U_TaxAmt { get; set; }

        [Column(TypeName = "decimal(19,6)")]
        [Required]
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
