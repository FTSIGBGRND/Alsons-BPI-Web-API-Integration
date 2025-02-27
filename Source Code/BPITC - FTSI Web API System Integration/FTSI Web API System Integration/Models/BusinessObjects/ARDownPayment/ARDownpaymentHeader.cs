using FTSI_Web_API_System_Integration.Models.Base.Document;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.ARDownPayment
{
    public class ARDownpaymentHeader : DocumentHeader
    {
        public List<ARDownpaymentLines> DocumentLines { get; set; } = new ();

        public ARDownpaymentWTax? DocumentWTax { get; set; }

    }
}
