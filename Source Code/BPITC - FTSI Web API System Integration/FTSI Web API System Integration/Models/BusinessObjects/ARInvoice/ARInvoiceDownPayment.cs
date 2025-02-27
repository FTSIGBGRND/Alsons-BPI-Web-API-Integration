using FTSI_Web_API_System_Integration.Models.Base.Documents;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice
{
    public class ARInvoiceDownPayment : DocumentDownpaymentsToDraw
    {
        [ForeignKey("HeaderId")]
        public ARInvoiceHeader? ARInvoiceHeader { get; set; }
    }
}
