using FTSI_Web_API_System_Integration.Models.Base.Document;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice
{
    public class APInvoiceHeader : DocumentHeader
    {
        public List<APInvoiceLines> DocumentLines { get; set; } = [];
        public APInvoiceWTax DocumentWTax { get; set; }
    }
}
