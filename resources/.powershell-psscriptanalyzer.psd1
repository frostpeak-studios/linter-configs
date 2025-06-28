@{
    Rules = @{
        # Enable default rules.
        PSAvoidUsingCmdletAliases = @{ Enable = $true }
        PSAvoidUsingPositionalParameters = @{ Enable = $true }
        PSAvoidGlobalVars = @{ Enable = $true }
        PSAvoidUsingInvokeExpression = @{ Enable = $true }
        PSAvoidUsingPlainTextForPassword = @{ Enable = $true }
        PSAvoidUsingComputerNameHardcoded = @{ Enable = $true }
        PSAvoidUsingConvertToSecureStringWithPlainText = @{ Enable = $true }
        PSAvoidUsingWMICmdlet = @{ Enable = $true }
        PSAvoidUsingWriteHost = @{ Enable = $false }
        PSAvoidOverwritingBuiltInCmdlets = @{ Enable = $true }
        PSUseApprovedVerbs = @{ Enable = $true }
        # This was throwing errors even when the indentation looked correct. Just stick with visual alignment.
        PSUseConsistentIndentation = @{ Enable = $false }
        PSUseConsistentWhitespace = @{ Enable = $true }
        # Don't care, this isn't Terraform.
        PSAlignAssignmentStatement = @{ Enable = $false }
        PSUseCorrectCasing = @{ Enable = $true }
        PSProvideCommentHelp = @{ Enable = $true }
        PSAvoidTrailingWhitespace = @{ Enable = $true }
        PSAvoidSemicolonsAsLineTerminators = @{ Enable = $true }
        # No BOM
        PSUseBOMForUnicodeEncodedFile = @{ Enable = $false }
        PSUseDeclaredVarsMoreThanAssignments = @{ Enable = $true }
        PSUsePSCredentialType = @{ Enable = $true }
        PSUseShouldProcessForStateChangingFunctions = @{ Enable = $false }
        # Configure noun exemptions.
        PSUseSingularNouns = @{
            Enable = $true
            NounAllowList = @('Data', 'Windows', 'Exists', 'Props', 'Notes', 'Results', 'Prerequisites', 'Dependencies')
        }
    }
    # PSUseShouldProcessForStateChangingFunctions
    # Most of the library is designed to work without user interaction, so we exclude it.
    # PSAvoidUsingWriteHost
    # We use Write-Host for the coloring in the console.
    ExcludeRules = @('PSUseShouldProcessForStateChangingFunctions', 'PSAvoidUsingWriteHost')
}
