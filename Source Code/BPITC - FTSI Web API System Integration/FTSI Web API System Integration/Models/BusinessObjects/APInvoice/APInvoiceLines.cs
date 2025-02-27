using FTSI_Web_API_System_Integration.Models.Base.Document;
using System.ComponentModel.DataAnnotations.Schema;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice
{
    public class APInvoiceLines : DocumentLines
    {
        [ForeignKey("HeaderId")]
        public APInvoiceHeader? APInvoiceHeader { get; set; }
    }
}
