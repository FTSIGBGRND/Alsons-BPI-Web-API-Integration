using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARDownPayment;

namespace FTSI_Web_API_System_Integration.Interfaces
{
    public interface IARDownpaymentRepository
    {
        Task AddAsync(ARDownpaymentHeader data);
        Task<ARDownpaymentHeader?> GetStatusAsync(Guid id);
        Task<int> SaveChangesAsync();
    }
}