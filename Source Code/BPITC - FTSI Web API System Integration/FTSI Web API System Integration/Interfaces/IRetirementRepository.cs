using FTSI_Web_API_System_Integration.Models.BusinessObjects.Retirement;

namespace FTSI_Web_API_System_Integration.Interfaces
{
    public interface IRetirementRepository
    {
        Task AddAsync(RetirementHeader retirement);
        Task<RetirementHeader?> GetStatusAsync(Guid id);
        Task<int> SaveChangesAsync();
        void Update(RetirementHeader entity);
    }
}