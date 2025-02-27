using FTSI_Web_API_System_Integration.Models.Base.Document;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.ARDownPayment
{
    public class ARDownpaymentLines : DocumentLines
    {
        [ForeignKey("HeaderId")]
        public ARDownpaymentHeader? DocumentHeader { get; set; }
    }
}
