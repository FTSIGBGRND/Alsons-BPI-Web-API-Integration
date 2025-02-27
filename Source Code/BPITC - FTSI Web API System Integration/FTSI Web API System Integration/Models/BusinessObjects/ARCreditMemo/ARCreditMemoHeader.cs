using FTSI_Web_API_System_Integration.Models.Base.Document;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo
{
    public class ARCreditMemoHeader : DocumentHeader
    {
        public List<ARCreditMemoLines> DocumentLines { get; set; } = new();
        public List<ARCreditMemoWTax>? DocumentWTax { get; set; } = [];
    }
}
