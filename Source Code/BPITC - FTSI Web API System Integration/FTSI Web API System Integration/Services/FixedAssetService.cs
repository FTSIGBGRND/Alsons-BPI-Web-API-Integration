using FTSI_Web_API_System_Integration.DTOs.Capitalization;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.AssetDocuments;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.Items;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using NuGet.Protocol.Core.Types;

namespace FTSI_Web_API_System_Integration.Services
{
    public class FixedAssetService
    {
        private readonly IUnitOfWork _unitOfWork;

        public FixedAssetService(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public async Task<AssetDocument> AddFixedAssetAsync(AddFixedAssetDTO asset)
        {
            DateTime createdAt = DateTime.Now;

            // Items
            Item item = new Item();
            item.ItemCode = asset.ItemCode;
            item.ItemName = asset.ItemName;
            item.AssetClass = asset.AssetClass;
            item.U_SalesAg = asset.U_SalesAg;
            item.U_AssetAcct = asset.U_AssetAcct;
            item.U_Maker = asset.U_Maker;
            item.U_Model = asset.U_Model;
            item.U_ModYear = asset.U_ModYear;
            item.U_Serial = asset.U_Serial;
            item.U_GDate = asset.U_GDate;
            item.U_Chasis = asset.U_Chasis;
            item.U_Engine = asset.U_Engine;
            item.U_Color = asset.U_Color;
            item.U_EquipID = asset.U_EquipID;
            item.U_LMADate = asset.U_LMADate;
            item.U_NMADate = asset.U_NMADate;
            item.U_AssInfo1 = asset.U_AssInfo1;
            item.U_AssInfo2 = asset.U_AssInfo2;
            item.U_AssInfo3 = asset.U_AssInfo3;
            item.U_AssLoc = asset.U_AssLoc;
            item.U_AssLocM = asset.U_AssLocM;
            item.U_AssRes = asset.U_AssRes;
            item.U_Contract = asset.U_Contract;
            item.CreatedAt = createdAt;
            item.U_RefNum = asset.U_RefNum;
            item.DepreciationParameters?.Add(new DepreciationParameters
            {
                ItemCode = asset.ItemCode,
                DprStart = asset.DprStart,
                VisOrder = 0,
                UsefulLife = asset.UsefulLife,
                CreatedAt = createdAt,
            });


            // Capitalization

            AssetDocument assetDoc = new AssetDocument();
            assetDoc.CreatedAt = createdAt;
            assetDoc.PostDate = asset.PostDate;
            assetDoc.U_RefNum = asset.U_RefNum;

            assetDoc.AssetDocumentLines.Add(
                new AssetDocumentLine
                {
                    ItemCode = asset.ItemCode,
                    Quantity = asset.Quantity,
                    LineNum = 0,
                    LineTotal = asset.LineTotal,
                });


            await _unitOfWork.Item.AddAsync(item);
            await _unitOfWork.Capitalization.AddAsync(assetDoc);
            await _unitOfWork.Save();

            return assetDoc;
        }

        public async Task<AssetDocument?> GetStatusAsync(Guid id)
        {
            return await _unitOfWork.Capitalization.GetStatusAsync(id);
        }
    }

}
