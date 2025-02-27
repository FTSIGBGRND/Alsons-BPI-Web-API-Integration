using FTSI_Web_API_System_Integration.Models.BusinessObjects.AssetDocuments;

namespace FTSI_Web_API_System_Integration.Interfaces
{
    public interface ICapitalizationRepository
    {
        Task AddAsync(AssetDocument asset);
        Task<AssetDocument?> GetStatusAsync(Guid id);
        Task<int> SaveChangesAsync();
    }
}