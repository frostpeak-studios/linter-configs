# --- .tflint.hcl - Configuration for tflint ---
# --- Docs: https://github.com/terraform-linters/tflint/blob/master/docs/user-guide/config.md ---

# --- General configuration ---

config {
    call_module_type = "local"
    force = false
}

# --- Plugins ---

plugin "terraform" {
    enabled = true
    preset  = "recommended"
}

plugin "azurerm" {
    enabled = true
    version = "0.28.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

# --- General Rules ---

rule "terraform_documented_outputs" {
    enabled = true
}

rule "terraform_documented_variables" {
    enabled = true
}

rule "terraform_naming_convention" {
    enabled = true
    format  = "snake_case"
}

rule "terraform_standard_module_structure" {
    enabled = true
}

rule "terraform_unused_required_providers" {
    enabled = true
}

# --- Azure Rules ---

rule "azurerm_resource_missing_tags" {
    enabled = true
    tags = [
        "company",
        "project",
        "owner",
        "env",
        "region",
        "cost_center",
    ]
}
