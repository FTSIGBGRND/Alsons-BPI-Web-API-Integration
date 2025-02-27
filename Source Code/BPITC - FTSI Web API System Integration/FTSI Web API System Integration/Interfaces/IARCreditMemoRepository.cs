using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;

namespace FTSI_Web_API_System_Integration.Interfaces
{
    public interface IARCreditMemoRepository
    {
        Task AddAsync(ARCreditMemoHeader creditMemo);
        Task<ARCreditMemoHeader> GetStatusAsync(Guid id);
        Task<int> SaveChangesAsync();
        void Update(ARCreditMemoHeader entity);
    }
}