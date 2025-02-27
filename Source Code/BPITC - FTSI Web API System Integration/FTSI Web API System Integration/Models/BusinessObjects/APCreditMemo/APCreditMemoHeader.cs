using FTSI_Web_API_System_Integration.Models.Base.Document;

namespace FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo
{
    public class APCreditMemoHeader : DocumentHeader
    {
        public List<APCreditMemoLines> DocumentLines { get; set; } = new();
        public List<APCreditMemoWTax>? DocumentWTax { get; set; } = [];
    }
}
