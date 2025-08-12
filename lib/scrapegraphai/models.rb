# frozen_string_literal: true

module Scrapegraphai
  [
    Scrapegraphai::Internal::Type::BaseModel,
    *Scrapegraphai::Internal::Type::BaseModel.subclasses
  ].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Scrapegraphai::Internal::AnyHash) } }
  end

  Scrapegraphai::Internal::Util.walk_namespaces(Scrapegraphai::Models).each do |mod|
    case mod
    in Scrapegraphai::Internal::Type::Enum | Scrapegraphai::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Scrapegraphai::Internal::Util.walk_namespaces(Scrapegraphai::Models)
                               .lazy
                               .grep(Scrapegraphai::Internal::Type::Union)
                               .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  CompletedMarkdownify = Scrapegraphai::Models::CompletedMarkdownify

  CompletedSearchScraper = Scrapegraphai::Models::CompletedSearchScraper

  CompletedSmartscraper = Scrapegraphai::Models::CompletedSmartscraper

  CrawlRetrieveResultsParams = Scrapegraphai::Models::CrawlRetrieveResultsParams

  CrawlStartParams = Scrapegraphai::Models::CrawlStartParams

  CreditRetrieveParams = Scrapegraphai::Models::CreditRetrieveParams

  FailedSmartscraper = Scrapegraphai::Models::FailedSmartscraper

  FeedbackSubmitParams = Scrapegraphai::Models::FeedbackSubmitParams

  GenerateSchemaCreateParams = Scrapegraphai::Models::GenerateSchemaCreateParams

  GenerateSchemaRetrieveParams = Scrapegraphai::Models::GenerateSchemaRetrieveParams

  HealthzCheckParams = Scrapegraphai::Models::HealthzCheckParams

  MarkdownifyConvertParams = Scrapegraphai::Models::MarkdownifyConvertParams

  MarkdownifyRetrieveStatusParams = Scrapegraphai::Models::MarkdownifyRetrieveStatusParams

  SearchscraperCreateParams = Scrapegraphai::Models::SearchscraperCreateParams

  SearchscraperRetrieveStatusParams = Scrapegraphai::Models::SearchscraperRetrieveStatusParams

  SmartscraperCreateParams = Scrapegraphai::Models::SmartscraperCreateParams

  SmartscraperListParams = Scrapegraphai::Models::SmartscraperListParams

  SmartscraperRetrieveParams = Scrapegraphai::Models::SmartscraperRetrieveParams

  ValidateAPIKeyParams = Scrapegraphai::Models::ValidateAPIKeyParams
end
