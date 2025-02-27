using FTSI_Web_API_System_Integration.Models.Base.Document;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo
{
    public class APCreditMemoWTax : DocumentWTax
    {
        [ForeignKey("HeaderId")]
        public APCreditMemoHeader? DocumentHeader { get; set; }
    }
}
