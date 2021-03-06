# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module Google
  module Cloud
    module Translate
      module V3
        # Configures which glossary should be used for a specific target language,
        # and defines options for applying that glossary.
        # @!attribute [rw] glossary
        #   @return [String]
        #     Required. Specifies the glossary used for this translation. Use
        #     this format: projects/*/locations/*/glossaries/*
        # @!attribute [rw] ignore_case
        #   @return [true, false]
        #     Optional. Indicates match is case-insensitive.
        #     Default value is false if missing.
        class TranslateTextGlossaryConfig; end

        # The request message for synchronous translation.
        # @!attribute [rw] contents
        #   @return [Array<String>]
        #     Required. The content of the input in string format.
        #     We recommend the total content be less than 30k codepoints.
        #     Use BatchTranslateText for larger text.
        # @!attribute [rw] mime_type
        #   @return [String]
        #     Optional. The format of the source text, for example, "text/html",
        #      "text/plain". If left blank, the MIME type defaults to "text/html".
        # @!attribute [rw] source_language_code
        #   @return [String]
        #     Optional. The BCP-47 language code of the input text if
        #     known, for example, "en-US" or "sr-Latn". Supported language codes are
        #     listed in Language Support. If the source language isn't specified, the API
        #     attempts to identify the source language automatically and returns the
        #     source language within the response.
        # @!attribute [rw] target_language_code
        #   @return [String]
        #     Required. The BCP-47 language code to use for translation of the input
        #     text, set to one of the language codes listed in Language Support.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. Project or location to make a call. Must refer to a caller's
        #     project.
        #
        #     Format: `projects/{project-number-or-id}` or
        #     `projects/{project-number-or-id}/locations/{location-id}`.
        #
        #     For global calls, use `projects/{project-number-or-id}/locations/global` or
        #     `projects/{project-number-or-id}`.
        #
        #     Non-global location is required for requests using AutoML models or
        #     custom glossaries.
        #
        #     Models and glossaries must be within the same region (have same
        #     location-id), otherwise an INVALID_ARGUMENT (400) error is returned.
        # @!attribute [rw] model
        #   @return [String]
        #     Optional. The `model` type requested for this translation.
        #
        #     The format depends on model type:
        #
        #     * AutoML Translation models:
        #       `projects/{project-number-or-id}/locations/{location-id}/models/{model-id}`
        #
        #     * General (built-in) models:
        #       `projects/{project-number-or-id}/locations/{location-id}/models/general/nmt`,
        #       `projects/{project-number-or-id}/locations/{location-id}/models/general/base`
        #
        #
        #     For global (non-regionalized) requests, use `location-id` `global`.
        #     For example,
        #     `projects/{project-number-or-id}/locations/global/models/general/nmt`.
        #
        #     If missing, the system decides which google base model to use.
        # @!attribute [rw] glossary_config
        #   @return [Google::Cloud::Translate::V3::TranslateTextGlossaryConfig]
        #     Optional. Glossary to be applied. The glossary must be
        #     within the same region (have the same location-id) as the model, otherwise
        #     an INVALID_ARGUMENT (400) error is returned.
        # @!attribute [rw] labels
        #   @return [Hash{String => String}]
        #     Optional. The labels with user-defined metadata for the request.
        #
        #     Label keys and values can be no longer than 63 characters
        #     (Unicode codepoints), can only contain lowercase letters, numeric
        #     characters, underscores and dashes. International characters are allowed.
        #     Label values are optional. Label keys must start with a letter.
        #
        #     See https://cloud.google.com/translate/docs/labels for more information.
        class TranslateTextRequest; end

        # @!attribute [rw] translations
        #   @return [Array<Google::Cloud::Translate::V3::Translation>]
        #     Text translation responses with no glossary applied.
        #     This field has the same length as
        #     {Google::Cloud::Translate::V3::TranslateTextRequest#contents `contents`}.
        # @!attribute [rw] glossary_translations
        #   @return [Array<Google::Cloud::Translate::V3::Translation>]
        #     Text translation responses if a glossary is provided in the request.
        #     This can be the same as
        #     {Google::Cloud::Translate::V3::TranslateTextResponse#translations `translations`}
        #     if no terms apply. This field has the same length as
        #     {Google::Cloud::Translate::V3::TranslateTextRequest#contents `contents`}.
        class TranslateTextResponse; end

        # A single translation response.
        # @!attribute [rw] translated_text
        #   @return [String]
        #     Text translated into the target language.
        # @!attribute [rw] model
        #   @return [String]
        #     Only present when `model` is present in the request.
        #     `model` here is normalized to have project number.
        #
        #     For example:
        #     If the `model` requested in TranslationTextRequest is
        #     `projects/{project-id}/locations/{location-id}/models/general/nmt` then
        #     `model` here would be normalized to
        #     `projects/{project-number}/locations/{location-id}/models/general/nmt`.
        # @!attribute [rw] detected_language_code
        #   @return [String]
        #     The BCP-47 language code of source text in the initial request, detected
        #     automatically, if no source language was passed within the initial
        #     request. If the source language was passed, auto-detection of the language
        #     does not occur and this field is empty.
        # @!attribute [rw] glossary_config
        #   @return [Google::Cloud::Translate::V3::TranslateTextGlossaryConfig]
        #     The `glossary_config` used for this translation.
        class Translation; end

        # The request message for language detection.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. Project or location to make a call. Must refer to a caller's
        #     project.
        #
        #     Format: `projects/{project-number-or-id}/locations/{location-id}` or
        #     `projects/{project-number-or-id}`.
        #
        #     For global calls, use `projects/{project-number-or-id}/locations/global` or
        #     `projects/{project-number-or-id}`.
        #
        #     Only models within the same region (has same location-id) can be used.
        #     Otherwise an INVALID_ARGUMENT (400) error is returned.
        # @!attribute [rw] model
        #   @return [String]
        #     Optional. The language detection model to be used.
        #
        #     Format:
        #     `projects/{project-number-or-id}/locations/{location-id}/models/language-detection/{model-id}`
        #
        #     Only one language detection model is currently supported:
        #     `projects/{project-number-or-id}/locations/{location-id}/models/language-detection/default`.
        #
        #     If not specified, the default model is used.
        # @!attribute [rw] content
        #   @return [String]
        #     The content of the input stored as a string.
        # @!attribute [rw] mime_type
        #   @return [String]
        #     Optional. The format of the source text, for example, "text/html",
        #     "text/plain". If left blank, the MIME type defaults to "text/html".
        # @!attribute [rw] labels
        #   @return [Hash{String => String}]
        #     Optional. The labels with user-defined metadata for the request.
        #
        #     Label keys and values can be no longer than 63 characters
        #     (Unicode codepoints), can only contain lowercase letters, numeric
        #     characters, underscores and dashes. International characters are allowed.
        #     Label values are optional. Label keys must start with a letter.
        #
        #     See https://cloud.google.com/translate/docs/labels for more information.
        class DetectLanguageRequest; end

        # The response message for language detection.
        # @!attribute [rw] language_code
        #   @return [String]
        #     The BCP-47 language code of source content in the request, detected
        #     automatically.
        # @!attribute [rw] confidence
        #   @return [Float]
        #     The confidence of the detection result for this language.
        class DetectedLanguage; end

        # The response message for language detection.
        # @!attribute [rw] languages
        #   @return [Array<Google::Cloud::Translate::V3::DetectedLanguage>]
        #     A list of detected languages sorted by detection confidence in descending
        #     order. The most probable language first.
        class DetectLanguageResponse; end

        # The request message for discovering supported languages.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. Project or location to make a call. Must refer to a caller's
        #     project.
        #
        #     Format: `projects/{project-number-or-id}` or
        #     `projects/{project-number-or-id}/locations/{location-id}`.
        #
        #     For global calls, use `projects/{project-number-or-id}/locations/global` or
        #     `projects/{project-number-or-id}`.
        #
        #     Non-global location is required for AutoML models.
        #
        #     Only models within the same region (have same location-id) can be used,
        #     otherwise an INVALID_ARGUMENT (400) error is returned.
        # @!attribute [rw] display_language_code
        #   @return [String]
        #     Optional. The language to use to return localized, human readable names
        #     of supported languages. If missing, then display names are not returned
        #     in a response.
        # @!attribute [rw] model
        #   @return [String]
        #     Optional. Get supported languages of this model.
        #
        #     The format depends on model type:
        #
        #     * AutoML Translation models:
        #       `projects/{project-number-or-id}/locations/{location-id}/models/{model-id}`
        #
        #     * General (built-in) models:
        #       `projects/{project-number-or-id}/locations/{location-id}/models/general/nmt`,
        #       `projects/{project-number-or-id}/locations/{location-id}/models/general/base`
        #
        #
        #     Returns languages supported by the specified model.
        #     If missing, we get supported languages of Google general base (PBMT) model.
        class GetSupportedLanguagesRequest; end

        # The response message for discovering supported languages.
        # @!attribute [rw] languages
        #   @return [Array<Google::Cloud::Translate::V3::SupportedLanguage>]
        #     A list of supported language responses. This list contains an entry
        #     for each language the Translation API supports.
        class SupportedLanguages; end

        # A single supported language response corresponds to information related
        # to one supported language.
        # @!attribute [rw] language_code
        #   @return [String]
        #     Supported language code, generally consisting of its ISO 639-1
        #     identifier, for example, 'en', 'ja'. In certain cases, BCP-47 codes
        #     including language and region identifiers are returned (for example,
        #     'zh-TW' and 'zh-CN')
        # @!attribute [rw] display_name
        #   @return [String]
        #     Human readable name of the language localized in the display language
        #     specified in the request.
        # @!attribute [rw] support_source
        #   @return [true, false]
        #     Can be used as source language.
        # @!attribute [rw] support_target
        #   @return [true, false]
        #     Can be used as target language.
        class SupportedLanguage; end

        # The Google Cloud Storage location for the input content.
        # @!attribute [rw] input_uri
        #   @return [String]
        #     Required. Source data URI. For example, `gs://my_bucket/my_object`.
        class GcsSource; end

        # Input configuration for BatchTranslateText request.
        # @!attribute [rw] mime_type
        #   @return [String]
        #     Optional. Can be "text/plain" or "text/html".
        #     For `.tsv`, "text/html" is used if mime_type is missing.
        #     For `.html`, this field must be "text/html" or empty.
        #     For `.txt`, this field must be "text/plain" or empty.
        # @!attribute [rw] gcs_source
        #   @return [Google::Cloud::Translate::V3::GcsSource]
        #     Required. Google Cloud Storage location for the source input.
        #     This can be a single file (for example,
        #     `gs://translation-test/input.tsv`) or a wildcard (for example,
        #     `gs://translation-test/*`). If a file extension is `.tsv`, it can
        #     contain either one or two columns. The first column (optional) is the id
        #     of the text request. If the first column is missing, we use the row
        #     number (0-based) from the input file as the ID in the output file. The
        #     second column is the actual text to be
        #      translated. We recommend each row be <= 10K Unicode codepoints,
        #     otherwise an error might be returned.
        #     Note that the input tsv must be RFC 4180 compliant.
        #
        #     You could use https://github.com/Clever/csvlint to check potential
        #     formatting errors in your tsv file.
        #     csvlint --delimiter='\t' your_input_file.tsv
        #
        #     The other supported file extensions are `.txt` or `.html`, which is
        #     treated as a single large chunk of text.
        class InputConfig; end

        # The Google Cloud Storage location for the output content.
        # @!attribute [rw] output_uri_prefix
        #   @return [String]
        #     Required. There must be no files under 'output_uri_prefix'.
        #     'output_uri_prefix' must end with "/" and start with "gs://", otherwise an
        #     INVALID_ARGUMENT (400) error is returned.
        class GcsDestination; end

        # Output configuration for BatchTranslateText request.
        # @!attribute [rw] gcs_destination
        #   @return [Google::Cloud::Translate::V3::GcsDestination]
        #     Google Cloud Storage destination for output content.
        #     For every single input file (for example, gs://a/b/c.[extension]), we
        #     generate at most 2 * n output files. (n is the # of target_language_codes
        #     in the BatchTranslateTextRequest).
        #
        #     Output files (tsv) generated are compliant with RFC 4180 except that
        #     record delimiters are '\n' instead of '\r\n'. We don't provide any way to
        #     change record delimiters.
        #
        #     While the input files are being processed, we write/update an index file
        #     'index.csv'  under 'output_uri_prefix' (for example,
        #     gs://translation-test/index.csv) The index file is generated/updated as
        #     new files are being translated. The format is:
        #
        #     input_file,target_language_code,translations_file,errors_file,
        #     glossary_translations_file,glossary_errors_file
        #
        #     input_file is one file we matched using gcs_source.input_uri.
        #     target_language_code is provided in the request.
        #     translations_file contains the translations. (details provided below)
        #     errors_file contains the errors during processing of the file. (details
        #     below). Both translations_file and errors_file could be empty
        #     strings if we have no content to output.
        #     glossary_translations_file and glossary_errors_file are always empty
        #     strings if the input_file is tsv. They could also be empty if we have no
        #     content to output.
        #
        #     Once a row is present in index.csv, the input/output matching never
        #     changes. Callers should also expect all the content in input_file are
        #     processed and ready to be consumed (that is, no partial output file is
        #     written).
        #
        #     The format of translations_file (for target language code 'trg') is:
        #     gs://translation_test/a_b_c_'trg'_translations.[extension]
        #
        #     If the input file extension is tsv, the output has the following
        #     columns:
        #     Column 1: ID of the request provided in the input, if it's not
        #     provided in the input, then the input row number is used (0-based).
        #     Column 2: source sentence.
        #     Column 3: translation without applying a glossary. Empty string if there
        #     is an error.
        #     Column 4 (only present if a glossary is provided in the request):
        #     translation after applying the glossary. Empty string if there is an
        #     error applying the glossary. Could be same string as column 3 if there is
        #     no glossary applied.
        #
        #     If input file extension is a txt or html, the translation is directly
        #     written to the output file. If glossary is requested, a separate
        #     glossary_translations_file has format of
        #     gs://translation_test/a_b_c_'trg'_glossary_translations.[extension]
        #
        #     The format of errors file (for target language code 'trg') is:
        #     gs://translation_test/a_b_c_'trg'_errors.[extension]
        #
        #     If the input file extension is tsv, errors_file contains the following:
        #     Column 1: ID of the request provided in the input, if it's not
        #     provided in the input, then the input row number is used (0-based).
        #     Column 2: source sentence.
        #     Column 3: Error detail for the translation. Could be empty.
        #     Column 4 (only present if a glossary is provided in the request):
        #     Error when applying the glossary.
        #
        #     If the input file extension is txt or html, glossary_error_file will be
        #     generated that contains error details. glossary_error_file has format of
        #     gs://translation_test/a_b_c_'trg'_glossary_errors.[extension]
        class OutputConfig; end

        # The batch translation request.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. Location to make a call. Must refer to a caller's project.
        #
        #     Format: `projects/{project-number-or-id}/locations/{location-id}`.
        #
        #     The `global` location is not supported for batch translation.
        #
        #     Only AutoML Translation models or glossaries within the same region (have
        #     the same location-id) can be used, otherwise an INVALID_ARGUMENT (400)
        #     error is returned.
        # @!attribute [rw] source_language_code
        #   @return [String]
        #     Required. Source language code.
        # @!attribute [rw] target_language_codes
        #   @return [Array<String>]
        #     Required. Specify up to 10 language codes here.
        # @!attribute [rw] models
        #   @return [Hash{String => String}]
        #     Optional. The models to use for translation. Map's key is target language
        #     code. Map's value is model name. Value can be a built-in general model,
        #     or an AutoML Translation model.
        #
        #     The value format depends on model type:
        #
        #     * AutoML Translation models:
        #       `projects/{project-number-or-id}/locations/{location-id}/models/{model-id}`
        #
        #     * General (built-in) models:
        #       `projects/{project-number-or-id}/locations/{location-id}/models/general/nmt`,
        #       `projects/{project-number-or-id}/locations/{location-id}/models/general/base`
        #
        #
        #     If the map is empty or a specific model is
        #     not requested for a language pair, then default google model (nmt) is used.
        # @!attribute [rw] input_configs
        #   @return [Array<Google::Cloud::Translate::V3::InputConfig>]
        #     Required. Input configurations.
        #     The total number of files matched should be <= 1000.
        #     The total content size should be <= 100M Unicode codepoints.
        #     The files must use UTF-8 encoding.
        # @!attribute [rw] output_config
        #   @return [Google::Cloud::Translate::V3::OutputConfig]
        #     Required. Output configuration.
        #     If 2 input configs match to the same file (that is, same input path),
        #     we don't generate output for duplicate inputs.
        # @!attribute [rw] glossaries
        #   @return [Hash{String => Google::Cloud::Translate::V3::TranslateTextGlossaryConfig}]
        #     Optional. Glossaries to be applied for translation.
        #     It's keyed by target language code.
        # @!attribute [rw] labels
        #   @return [Hash{String => String}]
        #     Optional. The labels with user-defined metadata for the request.
        #
        #     Label keys and values can be no longer than 63 characters
        #     (Unicode codepoints), can only contain lowercase letters, numeric
        #     characters, underscores and dashes. International characters are allowed.
        #     Label values are optional. Label keys must start with a letter.
        #
        #     See https://cloud.google.com/translate/docs/labels for more information.
        class BatchTranslateTextRequest; end

        # State metadata for the batch translation operation.
        # @!attribute [rw] state
        #   @return [Google::Cloud::Translate::V3::BatchTranslateMetadata::State]
        #     The state of the operation.
        # @!attribute [rw] translated_characters
        #   @return [Integer]
        #     Number of successfully translated characters so far (Unicode codepoints).
        # @!attribute [rw] failed_characters
        #   @return [Integer]
        #     Number of characters that have failed to process so far (Unicode
        #     codepoints).
        # @!attribute [rw] total_characters
        #   @return [Integer]
        #     Total number of characters (Unicode codepoints).
        #     This is the total number of codepoints from input files times the number of
        #     target languages and appears here shortly after the call is submitted.
        # @!attribute [rw] submit_time
        #   @return [Google::Protobuf::Timestamp]
        #     Time when the operation was submitted.
        class BatchTranslateMetadata; end

        # Stored in the
        # {Google::Longrunning::Operation#response}
        # field returned by BatchTranslateText if at least one sentence is translated
        # successfully.
        # @!attribute [rw] total_characters
        #   @return [Integer]
        #     Total number of characters (Unicode codepoints).
        # @!attribute [rw] translated_characters
        #   @return [Integer]
        #     Number of successfully translated characters (Unicode codepoints).
        # @!attribute [rw] failed_characters
        #   @return [Integer]
        #     Number of characters that have failed to process (Unicode codepoints).
        # @!attribute [rw] submit_time
        #   @return [Google::Protobuf::Timestamp]
        #     Time when the operation was submitted.
        # @!attribute [rw] end_time
        #   @return [Google::Protobuf::Timestamp]
        #     The time when the operation is finished and
        #     {Google::Longrunning::Operation#done} is
        #     set to true.
        class BatchTranslateResponse; end

        # Input configuration for glossaries.
        # @!attribute [rw] gcs_source
        #   @return [Google::Cloud::Translate::V3::GcsSource]
        #     Required. Google Cloud Storage location of glossary data.
        #     File format is determined based on the filename extension. API returns
        #     [google.rpc.Code.INVALID_ARGUMENT] for unsupported URI-s and file
        #     formats. Wildcards are not allowed. This must be a single file in one of
        #     the following formats:
        #
        #     For unidirectional glossaries:
        #
        #     * TSV/CSV (`.tsv`/`.csv`): 2 column file, tab- or comma-separated.
        #       The first column is source text. The second column is target text.
        #       The file must not contain headers. That is, the first row is data, not
        #       column names.
        #
        #     * TMX (`.tmx`): TMX file with parallel data defining source/target term
        #       pairs.
        #
        #     For equivalent term sets glossaries:
        #
        #     * CSV (`.csv`): Multi-column CSV file defining equivalent glossary terms
        #       in multiple languages. The format is defined for Google Translation
        #       Toolkit and documented in [Use a
        #       glossary](https://support.google.com/translatortoolkit/answer/6306379?hl=en).
        class GlossaryInputConfig; end

        # Represents a glossary built from user provided data.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The resource name of the glossary. Glossary names have the form
        #     `projects/{project-number-or-id}/locations/{location-id}/glossaries/{glossary-id}`.
        # @!attribute [rw] language_pair
        #   @return [Google::Cloud::Translate::V3::Glossary::LanguageCodePair]
        #     Used with unidirectional glossaries.
        # @!attribute [rw] language_codes_set
        #   @return [Google::Cloud::Translate::V3::Glossary::LanguageCodesSet]
        #     Used with equivalent term set glossaries.
        # @!attribute [rw] input_config
        #   @return [Google::Cloud::Translate::V3::GlossaryInputConfig]
        #     Required. Provides examples to build the glossary from.
        #     Total glossary must not exceed 10M Unicode codepoints.
        # @!attribute [rw] entry_count
        #   @return [Integer]
        #     Output only. The number of entries defined in the glossary.
        # @!attribute [rw] submit_time
        #   @return [Google::Protobuf::Timestamp]
        #     Output only. When CreateGlossary was called.
        # @!attribute [rw] end_time
        #   @return [Google::Protobuf::Timestamp]
        #     Output only. When the glossary creation was finished.
        class Glossary
          # Used with unidirectional glossaries.
          # @!attribute [rw] source_language_code
          #   @return [String]
          #     Required. The BCP-47 language code of the input text, for example,
          #     "en-US". Expected to be an exact match for GlossaryTerm.language_code.
          # @!attribute [rw] target_language_code
          #   @return [String]
          #     Required. The BCP-47 language code for translation output, for example,
          #     "zh-CN". Expected to be an exact match for GlossaryTerm.language_code.
          class LanguageCodePair; end

          # Used with equivalent term set glossaries.
          # @!attribute [rw] language_codes
          #   @return [Array<String>]
          #     The BCP-47 language code(s) for terms defined in the glossary.
          #     All entries are unique. The list contains at least two entries.
          #     Expected to be an exact match for GlossaryTerm.language_code.
          class LanguageCodesSet; end
        end

        # Request message for CreateGlossary.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The project name.
        # @!attribute [rw] glossary
        #   @return [Google::Cloud::Translate::V3::Glossary]
        #     Required. The glossary to create.
        class CreateGlossaryRequest; end

        # Request message for GetGlossary.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The name of the glossary to retrieve.
        class GetGlossaryRequest; end

        # Request message for DeleteGlossary.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The name of the glossary to delete.
        class DeleteGlossaryRequest; end

        # Request message for ListGlossaries.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The name of the project from which to list all of the glossaries.
        # @!attribute [rw] page_size
        #   @return [Integer]
        #     Optional. Requested page size. The server may return fewer glossaries than
        #     requested. If unspecified, the server picks an appropriate default.
        # @!attribute [rw] page_token
        #   @return [String]
        #     Optional. A token identifying a page of results the server should return.
        #     Typically, this is the value of [ListGlossariesResponse.next_page_token]
        #     returned from the previous call to `ListGlossaries` method.
        #     The first page is returned if `page_token`is empty or missing.
        # @!attribute [rw] filter
        #   @return [String]
        #     Optional. Filter specifying constraints of a list operation.
        #     Filtering is not supported yet, and the parameter currently has no effect.
        #     If missing, no filtering is performed.
        class ListGlossariesRequest; end

        # Response message for ListGlossaries.
        # @!attribute [rw] glossaries
        #   @return [Array<Google::Cloud::Translate::V3::Glossary>]
        #     The list of glossaries for a project.
        # @!attribute [rw] next_page_token
        #   @return [String]
        #     A token to retrieve a page of results. Pass this value in the
        #     [ListGlossariesRequest.page_token] field in the subsequent call to
        #     `ListGlossaries` method to retrieve the next page of results.
        class ListGlossariesResponse; end

        # Stored in the
        # {Google::Longrunning::Operation#metadata}
        # field returned by CreateGlossary.
        # @!attribute [rw] name
        #   @return [String]
        #     The name of the glossary that is being created.
        # @!attribute [rw] state
        #   @return [Google::Cloud::Translate::V3::CreateGlossaryMetadata::State]
        #     The current state of the glossary creation operation.
        # @!attribute [rw] submit_time
        #   @return [Google::Protobuf::Timestamp]
        #     The time when the operation was submitted to the server.
        class CreateGlossaryMetadata; end

        # Stored in the
        # {Google::Longrunning::Operation#metadata}
        # field returned by DeleteGlossary.
        # @!attribute [rw] name
        #   @return [String]
        #     The name of the glossary that is being deleted.
        # @!attribute [rw] state
        #   @return [Google::Cloud::Translate::V3::DeleteGlossaryMetadata::State]
        #     The current state of the glossary deletion operation.
        # @!attribute [rw] submit_time
        #   @return [Google::Protobuf::Timestamp]
        #     The time when the operation was submitted to the server.
        class DeleteGlossaryMetadata; end

        # Stored in the
        # {Google::Longrunning::Operation#response}
        # field returned by DeleteGlossary.
        # @!attribute [rw] name
        #   @return [String]
        #     The name of the deleted glossary.
        # @!attribute [rw] submit_time
        #   @return [Google::Protobuf::Timestamp]
        #     The time when the operation was submitted to the server.
        # @!attribute [rw] end_time
        #   @return [Google::Protobuf::Timestamp]
        #     The time when the glossary deletion is finished and
        #     {Google::Longrunning::Operation#done} is
        #     set to true.
        class DeleteGlossaryResponse; end
      end
    end
  end
end