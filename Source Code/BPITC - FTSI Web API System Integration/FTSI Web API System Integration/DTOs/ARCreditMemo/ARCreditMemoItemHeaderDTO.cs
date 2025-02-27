using FTSI_Web_API_System_Integration.DTOs.ARInvoice;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.DTOs.ARCreditMemo
{
    public class ARCreditMemoItemHeaderDTO
    {
        [MaxLength(15)]
        [Required]
        public string CardCode { get; set; }

        [MaxLength(100, ErrorMessage = "Business Partner Name cannot exceed 100 characters!")]
        public string? CardName { get; set; }

        [MaxLength(100, ErrorMessage = "Customer Reference Number cannot exceed 100 characters!")]
        [Required]
        public string NumAtCard { get; set; }

        [RegularExpression("^(S|I)$", ErrorMessage = "Invalid Value. Document Type Valid Values are S and I (S - Service | I - Items)!")]
        [DefaultValue('I')]
        [Required]
        public char DocType { get; set; } = 'I';

        [Required(ErrorMessage = "Document Date is missing!")]
        public DateOnly DocDate { get; set; }

        [Required(ErrorMessage = "Due Date is missing!")]
        public DateOnly DocDueDate { get; set; }

        [Required(ErrorMessage = "Tax Date is missing!")]
        public DateOnly TaxDate { get; set; }

        [MaxLength(254, ErrorMessage = "Journal Remarks cannot exceed 254 characters!")]
        [Required]
        public string JrnlMemo { get; set; }

        [MaxLength(254, ErrorMessage = "Comments/Remarks cannot exceed 254 characters!")]
        [Required]
        public string Comments { get; set; }

        [MaxLength(30, ErrorMessage = "Document Reference Number cannot exceed 30 characters!")]
        [Required]
        public string U_RefNum { get; set; }

        [MaxLength(100)]
        [Required]
        public string U_FileName { get; set; }

        [RegularExpression("^(N)$", ErrorMessage = "Posted Status accepts only N value!")]
        public char Posted { get; set; } = 'N';

        [Required(ErrorMessage = "AR Invoice Document Line(s) is missing!")]
        public List<ARCreditMemoItemLinesDTO>? DocumentLines { get; set; } = [];

        public List<ARCreditMemoWTaxDTO>? DocumentWTax { get; set; }
    }
}
