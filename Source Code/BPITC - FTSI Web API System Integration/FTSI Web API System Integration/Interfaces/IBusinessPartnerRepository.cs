using FTSI_Web_API_System_Integration.Models.BusinessObjects.BusinessPartner;

namespace FTSI_Web_API_System_Integration.Interfaces
{
    public interface IBusinessPartnerRepository
    {
        Task AddAsync(BusinessPartner bp);
        Task<BusinessPartner?> GetStatusAsync(Guid id);
        Task<int> SaveChangesAsync();
    }
}