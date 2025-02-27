using FTSI_Web_API_System_Integration.Models.Base.Document;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo
{
    public class ARCreditMemoLines : DocumentLines
    {
        [ForeignKey("HeaderId")]
        public ARCreditMemoHeader? ARCreditMemoHeader { get; set; }
    }
}
