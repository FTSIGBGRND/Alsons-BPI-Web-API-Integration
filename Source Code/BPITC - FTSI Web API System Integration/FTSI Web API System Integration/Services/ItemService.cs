using FTSI_Web_API_System_Integration.DTOs.Items;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.Items;

namespace FTSI_Web_API_System_Integration.Services
{
    public class ItemService
    {
        private readonly IItemRepository _repository;

        public ItemService(IItemRepository repository)
        {
            _repository = repository;
        }

        public async Task<Item?> GetStatusAsync(Guid id)
        {
            return await _repository.GetStatusAsync(id);
        }

        public async Task<Item> AddAsync(AddItemDTO dto)
        {
            DateTime createAt = DateTime.Now;

            Item item = new()
            {
                ItemCode = dto.ItemCode,
                ItemName = dto.ItemName,
                AsstStatus = dto.AsstStatus,
                ItemType = dto.ItemType,
                CreatedAt = createAt,
            };

            await _repository.AddAsync(item);
            await _repository.SaveChangesAsync();

            return item;
        }
    }
}