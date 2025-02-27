using FTSI_Web_API_System_Integration.Models.Base.Document;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice
{
    public class ARInvoiceHeader : DocumentHeader
    {
        public List<ARInvoiceLines> DocumentLines { get; set; } = [];
        public ARInvoiceWTax DocumentWTax { get; set; }
        public List<ARInvoiceDownPayment> DownpaymentsLines { get; set; } = [];
    }
}
