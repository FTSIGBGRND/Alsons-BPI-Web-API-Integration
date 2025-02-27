using System.ComponentModel.DataAnnotations;

namespace FTSI_Web_API_System_Integration.Attributes
{
    public class ValidateStringListAttribute : ValidationAttribute
    {
        private readonly string[] _allowedValues;

        // Constructor accepting the allowed values as parameters
        public ValidateStringListAttribute(params string[] allowedValues)
        {
            _allowedValues = allowedValues;
        }

        // Overriding the IsValid method to validate the value against the allowed values
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value == null || _allowedValues.Contains(value.ToString()))
            {
                return ValidationResult.Success;
            }

            // Custom error message with allowed values
            var allowedValuesString = string.Join(", ", _allowedValues);
            return new ValidationResult($"The value for {validationContext.DisplayName} must be one of the following: {allowedValuesString}.");
        }
    }
}
