using FTSI_Web_API_System_Integration.Models.BusinessObjects.Items;

namespace FTSI_Web_API_System_Integration.Interfaces
{
    public interface IItemRepository
    {
        Task AddAsync(Item item);
        Task<Item?> GetStatusAsync(Guid id);

        Task<int> SaveChangesAsync();
    }
}