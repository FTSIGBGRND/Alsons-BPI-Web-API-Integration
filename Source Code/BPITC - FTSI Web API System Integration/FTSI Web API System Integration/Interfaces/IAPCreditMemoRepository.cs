using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;

namespace FTSI_Web_API_System_Integration.Interfaces
{
    public interface IAPCreditMemoRepository
    {
        Task AddAsync(APCreditMemoHeader creditMemo);
        Task<APCreditMemoHeader?> GetStatusAsync(Guid id);
        Task<int> SaveChangesAsync();
        void Update(APCreditMemoHeader entity);
    }
}