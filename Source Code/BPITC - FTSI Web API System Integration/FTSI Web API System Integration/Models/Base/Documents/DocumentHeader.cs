using FTSI_Web_API_System_Integration.Models.UserDefined.DocumentUDF;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.Base.Document
{
    public class DocumentHeader : DocumentHeaderUDF
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid Id { get; set; }

        [MaxLength(11)]
        public int? DocEntry { get; set; }

        [MaxLength(11)]
        public int? DocNum { get; set; }

        [Required]
        [MaxLength(15)]
        public string? CardCode { get; set; }

        [MaxLength(100)]
        public string? CardName { get; set; }

        [MaxLength(100)]
        public string? NumAtCard { get; set; }
        public char? DocType { get; set; } = 'I';

        [Required]
        public DateOnly DocDate { get; set; }

        [Required]
        public DateOnly DocDueDate { get; set; }

        [Required]
        public DateOnly TaxDate { get; set; }
        public string? PaymentTerms { get; set; }

        [MaxLength(254)]
        public string? JrnlMemo { get; set; }

        [MaxLength(254)]
        public string? Comments { get; set; }
        public char Posted { get; set; } = 'N';

        public char Canceled { get; set; } = 'N';

        public DateTime? CancelDate { get; set; }

        public  DateTime CreatedAt { get; set; }
    }
}
