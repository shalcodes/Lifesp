// LifeSphere Neo4j schema setup
// Generated from: neo4j_updated_schema_new.md
// Generated on: 2026-07-09 03:39:30
//
// Purpose: create Neo4j constraints and indexes from the LifeSphere active schema documentation.
// This file does not create biomedical data nodes/relationships. Relationship patterns and example queries are included as comments.
// Compatible with Neo4j 5.x constraint/index syntax.

// -----------------------------------------------------------------------------
// 1. Uniqueness constraints for node primary keys
// -----------------------------------------------------------------------------

CREATE CONSTRAINT publication_publication_id_unique IF NOT EXISTS
FOR (n:`Publication`)
REQUIRE n.`publicationId` IS UNIQUE;

CREATE CONSTRAINT program_program_id_unique IF NOT EXISTS
FOR (n:`Program`)
REQUIRE n.`programId` IS UNIQUE;

CREATE CONSTRAINT evidence_evidence_id_unique IF NOT EXISTS
FOR (n:`Evidence`)
REQUIRE n.`evidenceId` IS UNIQUE;

CREATE CONSTRAINT diagnosis_diagnosis_id_unique IF NOT EXISTS
FOR (n:`Diagnosis`)
REQUIRE n.`diagnosisId` IS UNIQUE;

CREATE CONSTRAINT pathology_detail_pathology_detail_id_unique IF NOT EXISTS
FOR (n:`PathologyDetail`)
REQUIRE n.`pathologyDetailId` IS UNIQUE;

CREATE CONSTRAINT survival_survival_id_unique IF NOT EXISTS
FOR (n:`Survival`)
REQUIRE n.`survivalId` IS UNIQUE;

CREATE CONSTRAINT procedure_procedure_id_unique IF NOT EXISTS
FOR (n:`Procedure`)
REQUIRE n.`procedureId` IS UNIQUE;

CREATE CONSTRAINT perturbation_perturbation_id_unique IF NOT EXISTS
FOR (n:`Perturbation`)
REQUIRE n.`perturbationId` IS UNIQUE;

CREATE CONSTRAINT regulatory_element_element_id_unique IF NOT EXISTS
FOR (n:`RegulatoryElement`)
REQUIRE n.`elementId` IS UNIQUE;

CREATE CONSTRAINT protein_protein_id_unique IF NOT EXISTS
FOR (n:`Protein`)
REQUIRE n.`proteinId` IS UNIQUE;

CREATE CONSTRAINT metabolite_metabolite_id_unique IF NOT EXISTS
FOR (n:`Metabolite`)
REQUIRE n.`metaboliteId` IS UNIQUE;

CREATE CONSTRAINT pathway_pathway_id_unique IF NOT EXISTS
FOR (n:`Pathway`)
REQUIRE n.`pathwayId` IS UNIQUE;

CREATE CONSTRAINT study_study_id_unique IF NOT EXISTS
FOR (n:`Study`)
REQUIRE n.`studyId` IS UNIQUE;

CREATE CONSTRAINT subject_subject_id_unique IF NOT EXISTS
FOR (n:`Subject`)
REQUIRE n.`subjectId` IS UNIQUE;

CREATE CONSTRAINT sample_sample_id_unique IF NOT EXISTS
FOR (n:`Sample`)
REQUIRE n.`sampleId` IS UNIQUE;

CREATE CONSTRAINT assay_assay_id_unique IF NOT EXISTS
FOR (n:`Assay`)
REQUIRE n.`assayId` IS UNIQUE;

CREATE CONSTRAINT library_preparation_library_preparation_id_unique IF NOT EXISTS
FOR (n:`LibraryPreparation`)
REQUIRE n.`libraryPreparationId` IS UNIQUE;

CREATE CONSTRAINT intervention_intervention_id_unique IF NOT EXISTS
FOR (n:`Intervention`)
REQUIRE n.`interventionId` IS UNIQUE;

CREATE CONSTRAINT chemical_entity_chemical_entity_id_unique IF NOT EXISTS
FOR (n:`ChemicalEntity`)
REQUIRE n.`chemicalEntityId` IS UNIQUE;

CREATE CONSTRAINT organism_taxon_id_unique IF NOT EXISTS
FOR (n:`Organism`)
REQUIRE n.`taxonId` IS UNIQUE;

CREATE CONSTRAINT tissue_tissue_id_unique IF NOT EXISTS
FOR (n:`Tissue`)
REQUIRE n.`tissueId` IS UNIQUE;

CREATE CONSTRAINT organ_organ_id_unique IF NOT EXISTS
FOR (n:`Organ`)
REQUIRE n.`organId` IS UNIQUE;

CREATE CONSTRAINT developmental_stage_stage_id_unique IF NOT EXISTS
FOR (n:`DevelopmentalStage`)
REQUIRE n.`stageId` IS UNIQUE;

CREATE CONSTRAINT experimental_condition_condition_id_unique IF NOT EXISTS
FOR (n:`ExperimentalCondition`)
REQUIRE n.`conditionId` IS UNIQUE;

CREATE CONSTRAINT disease_disease_id_unique IF NOT EXISTS
FOR (n:`Disease`)
REQUIRE n.`diseaseId` IS UNIQUE;

CREATE CONSTRAINT gene_gene_id_unique IF NOT EXISTS
FOR (n:`Gene`)
REQUIRE n.`geneId` IS UNIQUE;

CREATE CONSTRAINT variant_variant_id_unique IF NOT EXISTS
FOR (n:`Variant`)
REQUIRE n.`variantId` IS UNIQUE;

CREATE CONSTRAINT cp_g_site_cpg_id_unique IF NOT EXISTS
FOR (n:`CpGSite`)
REQUIRE n.`cpgId` IS UNIQUE;

CREATE CONSTRAINT genomic_region_region_id_unique IF NOT EXISTS
FOR (n:`GenomicRegion`)
REQUIRE n.`regionId` IS UNIQUE;

CREATE CONSTRAINT phenotype_observation_phenotype_observation_id_unique IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
REQUIRE n.`phenotypeObservationId` IS UNIQUE;

CREATE CONSTRAINT variant_observation_variant_observation_id_unique IF NOT EXISTS
FOR (n:`VariantObservation`)
REQUIRE n.`variantObservationId` IS UNIQUE;

CREATE CONSTRAINT expression_observation_expression_observation_id_unique IF NOT EXISTS
FOR (n:`ExpressionObservation`)
REQUIRE n.`expressionObservationId` IS UNIQUE;

CREATE CONSTRAINT methylation_observation_methylation_observation_id_unique IF NOT EXISTS
FOR (n:`MethylationObservation`)
REQUIRE n.`methylationObservationId` IS UNIQUE;

CREATE CONSTRAINT protein_observation_protein_observation_id_unique IF NOT EXISTS
FOR (n:`ProteinObservation`)
REQUIRE n.`proteinObservationId` IS UNIQUE;

CREATE CONSTRAINT metabolite_observation_metabolite_observation_id_unique IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
REQUIRE n.`metaboliteObservationId` IS UNIQUE;

CREATE CONSTRAINT methylation_status_rule_methylation_status_rule_id_unique IF NOT EXISTS
FOR (n:`MethylationStatusRule`)
REQUIRE n.`methylationStatusRuleId` IS UNIQUE;

CREATE CONSTRAINT repository_repository_id_unique IF NOT EXISTS
FOR (n:`Repository`)
REQUIRE n.`repositoryId` IS UNIQUE;

CREATE CONSTRAINT single_cell_dataset_single_cell_dataset_id_unique IF NOT EXISTS
FOR (n:`SingleCellDataset`)
REQUIRE n.`singleCellDatasetId` IS UNIQUE;

CREATE CONSTRAINT cell_set_cell_set_id_unique IF NOT EXISTS
FOR (n:`CellSet`)
REQUIRE n.`cellSetId` IS UNIQUE;

CREATE CONSTRAINT cell_type_cell_type_id_unique IF NOT EXISTS
FOR (n:`CellType`)
REQUIRE n.`cellTypeId` IS UNIQUE;

CREATE CONSTRAINT cell_state_cell_state_id_unique IF NOT EXISTS
FOR (n:`CellState`)
REQUIRE n.`cellStateId` IS UNIQUE;

CREATE CONSTRAINT feature_feature_id_unique IF NOT EXISTS
FOR (n:`Feature`)
REQUIRE n.`featureId` IS UNIQUE;

// -----------------------------------------------------------------------------
// 2. Lookup indexes for high-frequency node filters
// -----------------------------------------------------------------------------

CREATE INDEX idx_publication_doi IF NOT EXISTS
FOR (n:`Publication`)
ON (n.`doi`);

CREATE INDEX idx_publication_pmid IF NOT EXISTS
FOR (n:`Publication`)
ON (n.`pmid`);

CREATE INDEX idx_publication_title IF NOT EXISTS
FOR (n:`Publication`)
ON (n.`title`);

CREATE INDEX idx_publication_publication_type IF NOT EXISTS
FOR (n:`Publication`)
ON (n.`publicationType`);

CREATE INDEX idx_publication_source_database IF NOT EXISTS
FOR (n:`Publication`)
ON (n.`sourceDatabase`);

CREATE INDEX idx_program_program_abbreviation IF NOT EXISTS
FOR (n:`Program`)
ON (n.`programAbbreviation`);

CREATE INDEX idx_program_program_name IF NOT EXISTS
FOR (n:`Program`)
ON (n.`programName`);

CREATE INDEX idx_program_program_type IF NOT EXISTS
FOR (n:`Program`)
ON (n.`programType`);

CREATE INDEX idx_program_country IF NOT EXISTS
FOR (n:`Program`)
ON (n.`country`);

CREATE INDEX idx_program_source_database IF NOT EXISTS
FOR (n:`Program`)
ON (n.`sourceDatabase`);

CREATE INDEX idx_study_study_abbreviation IF NOT EXISTS
FOR (n:`Study`)
ON (n.`studyAbbreviation`);

CREATE INDEX idx_study_study_name IF NOT EXISTS
FOR (n:`Study`)
ON (n.`studyName`);

CREATE INDEX idx_study_disease_type IF NOT EXISTS
FOR (n:`Study`)
ON (n.`diseaseType`);

CREATE INDEX idx_study_primary_site IF NOT EXISTS
FOR (n:`Study`)
ON (n.`primarySite`);

CREATE INDEX idx_study_source_dataset IF NOT EXISTS
FOR (n:`Study`)
ON (n.`sourceDataset`);

CREATE INDEX idx_study_data_access_level IF NOT EXISTS
FOR (n:`Study`)
ON (n.`dataAccessLevel`);

CREATE INDEX idx_study_cohort_name IF NOT EXISTS
FOR (n:`Study`)
ON (n.`cohortName`);

CREATE INDEX idx_subject_submitter_id IF NOT EXISTS
FOR (n:`Subject`)
ON (n.`submitterId`);

CREATE INDEX idx_subject_donor_id IF NOT EXISTS
FOR (n:`Subject`)
ON (n.`donorId`);

CREATE INDEX idx_subject_subject_type IF NOT EXISTS
FOR (n:`Subject`)
ON (n.`subjectType`);

CREATE INDEX idx_subject_species IF NOT EXISTS
FOR (n:`Subject`)
ON (n.`species`);

CREATE INDEX idx_subject_sex_at_birth IF NOT EXISTS
FOR (n:`Subject`)
ON (n.`sexAtBirth`);

CREATE INDEX idx_subject_genetic_ancestry IF NOT EXISTS
FOR (n:`Subject`)
ON (n.`geneticAncestry`);

CREATE INDEX idx_subject_developmental_stage IF NOT EXISTS
FOR (n:`Subject`)
ON (n.`developmentalStage`);

CREATE INDEX idx_sample_subject_id IF NOT EXISTS
FOR (n:`Sample`)
ON (n.`subjectId`);

CREATE INDEX idx_sample_external_sample_id IF NOT EXISTS
FOR (n:`Sample`)
ON (n.`externalSampleId`);

CREATE INDEX idx_sample_sample_class IF NOT EXISTS
FOR (n:`Sample`)
ON (n.`sampleClass`);

CREATE INDEX idx_sample_sample_type IF NOT EXISTS
FOR (n:`Sample`)
ON (n.`sampleType`);

CREATE INDEX idx_sample_sample_material IF NOT EXISTS
FOR (n:`Sample`)
ON (n.`sampleMaterial`);

CREATE INDEX idx_sample_cell_line_name IF NOT EXISTS
FOR (n:`Sample`)
ON (n.`cellLineName`);

CREATE INDEX idx_sample_suspension_type IF NOT EXISTS
FOR (n:`Sample`)
ON (n.`suspensionType`);

CREATE INDEX idx_sample_source_dataset IF NOT EXISTS
FOR (n:`Sample`)
ON (n.`sourceDataset`);

CREATE INDEX idx_sample_source_file IF NOT EXISTS
FOR (n:`Sample`)
ON (n.`sourceFile`);

CREATE INDEX idx_assay_assay_type IF NOT EXISTS
FOR (n:`Assay`)
ON (n.`assayType`);

CREATE INDEX idx_assay_platform IF NOT EXISTS
FOR (n:`Assay`)
ON (n.`platform`);

CREATE INDEX idx_assay_library_strategy IF NOT EXISTS
FOR (n:`Assay`)
ON (n.`libraryStrategy`);

CREATE INDEX idx_assay_reference_genome IF NOT EXISTS
FOR (n:`Assay`)
ON (n.`referenceGenome`);

CREATE INDEX idx_assay_omics_info IF NOT EXISTS
FOR (n:`Assay`)
ON (n.`omicsInfo`);

CREATE INDEX idx_assay_source_dataset IF NOT EXISTS
FOR (n:`Assay`)
ON (n.`sourceDataset`);

CREATE INDEX idx_assay_source_file IF NOT EXISTS
FOR (n:`Assay`)
ON (n.`sourceFile`);

CREATE INDEX idx_assay_is_single_cell_assay IF NOT EXISTS
FOR (n:`Assay`)
ON (n.`isSingleCellAssay`);

CREATE INDEX idx_library_preparation_library_preparation_name IF NOT EXISTS
FOR (n:`LibraryPreparation`)
ON (n.`libraryPreparationName`);

CREATE INDEX idx_library_preparation_library_strategy IF NOT EXISTS
FOR (n:`LibraryPreparation`)
ON (n.`libraryStrategy`);

CREATE INDEX idx_library_preparation_library_protocol IF NOT EXISTS
FOR (n:`LibraryPreparation`)
ON (n.`libraryProtocol`);

CREATE INDEX idx_library_preparation_library_kit IF NOT EXISTS
FOR (n:`LibraryPreparation`)
ON (n.`libraryKit`);

CREATE INDEX idx_library_preparation_input_material IF NOT EXISTS
FOR (n:`LibraryPreparation`)
ON (n.`inputMaterial`);

CREATE INDEX idx_library_preparation_selection_method IF NOT EXISTS
FOR (n:`LibraryPreparation`)
ON (n.`selectionMethod`);

CREATE INDEX idx_library_preparation_barcode_strategy IF NOT EXISTS
FOR (n:`LibraryPreparation`)
ON (n.`barcodeStrategy`);

CREATE INDEX idx_library_preparation_source_dataset IF NOT EXISTS
FOR (n:`LibraryPreparation`)
ON (n.`sourceDataset`);

CREATE INDEX idx_organism_scientific_name IF NOT EXISTS
FOR (n:`Organism`)
ON (n.`scientificName`);

CREATE INDEX idx_organism_common_name IF NOT EXISTS
FOR (n:`Organism`)
ON (n.`commonName`);

CREATE INDEX idx_tissue_tissue_name IF NOT EXISTS
FOR (n:`Tissue`)
ON (n.`tissueName`);

CREATE INDEX idx_tissue_tissue_type IF NOT EXISTS
FOR (n:`Tissue`)
ON (n.`tissueType`);

CREATE INDEX idx_tissue_source_vocabulary IF NOT EXISTS
FOR (n:`Tissue`)
ON (n.`sourceVocabulary`);

CREATE INDEX idx_organ_organ_name IF NOT EXISTS
FOR (n:`Organ`)
ON (n.`organName`);

CREATE INDEX idx_organ_organ_system IF NOT EXISTS
FOR (n:`Organ`)
ON (n.`organSystem`);

CREATE INDEX idx_developmental_stage_stage_name IF NOT EXISTS
FOR (n:`DevelopmentalStage`)
ON (n.`stageName`);

CREATE INDEX idx_developmental_stage_source_vocabulary IF NOT EXISTS
FOR (n:`DevelopmentalStage`)
ON (n.`sourceVocabulary`);

CREATE INDEX idx_experimental_condition_condition_name IF NOT EXISTS
FOR (n:`ExperimentalCondition`)
ON (n.`conditionName`);

CREATE INDEX idx_experimental_condition_condition_type IF NOT EXISTS
FOR (n:`ExperimentalCondition`)
ON (n.`conditionType`);

CREATE INDEX idx_experimental_condition_condition_label IF NOT EXISTS
FOR (n:`ExperimentalCondition`)
ON (n.`conditionLabel`);

CREATE INDEX idx_disease_disease_name IF NOT EXISTS
FOR (n:`Disease`)
ON (n.`diseaseName`);

CREATE INDEX idx_disease_disease_type IF NOT EXISTS
FOR (n:`Disease`)
ON (n.`diseaseType`);

CREATE INDEX idx_disease_ontology_id IF NOT EXISTS
FOR (n:`Disease`)
ON (n.`ontologyId`);

CREATE INDEX idx_disease_source_vocabulary IF NOT EXISTS
FOR (n:`Disease`)
ON (n.`sourceVocabulary`);

CREATE INDEX idx_disease_source_dataset IF NOT EXISTS
FOR (n:`Disease`)
ON (n.`sourceDataset`);

CREATE INDEX idx_diagnosis_subject_id IF NOT EXISTS
FOR (n:`Diagnosis`)
ON (n.`subjectId`);

CREATE INDEX idx_diagnosis_disease_id IF NOT EXISTS
FOR (n:`Diagnosis`)
ON (n.`diseaseId`);

CREATE INDEX idx_diagnosis_diagnosis_role IF NOT EXISTS
FOR (n:`Diagnosis`)
ON (n.`diagnosisRole`);

CREATE INDEX idx_diagnosis_diagnosis_code IF NOT EXISTS
FOR (n:`Diagnosis`)
ON (n.`diagnosisCode`);

CREATE INDEX idx_diagnosis_diagnosis_code_system IF NOT EXISTS
FOR (n:`Diagnosis`)
ON (n.`diagnosisCodeSystem`);

CREATE INDEX idx_diagnosis_disease_subtype IF NOT EXISTS
FOR (n:`Diagnosis`)
ON (n.`diseaseSubtype`);

CREATE INDEX idx_diagnosis_pathologic_stage IF NOT EXISTS
FOR (n:`Diagnosis`)
ON (n.`pathologicStage`);

CREATE INDEX idx_diagnosis_tumor_grade IF NOT EXISTS
FOR (n:`Diagnosis`)
ON (n.`tumorGrade`);

CREATE INDEX idx_diagnosis_tumor_subtype IF NOT EXISTS
FOR (n:`Diagnosis`)
ON (n.`tumorSubtype`);

CREATE INDEX idx_diagnosis_is_normal IF NOT EXISTS
FOR (n:`Diagnosis`)
ON (n.`isNormal`);

CREATE INDEX idx_diagnosis_source_dataset IF NOT EXISTS
FOR (n:`Diagnosis`)
ON (n.`sourceDataset`);

CREATE INDEX idx_pathology_detail_diagnosis_id IF NOT EXISTS
FOR (n:`PathologyDetail`)
ON (n.`diagnosisId`);

CREATE INDEX idx_pathology_detail_sample_id IF NOT EXISTS
FOR (n:`PathologyDetail`)
ON (n.`sampleId`);

CREATE INDEX idx_pathology_detail_anatomical_site IF NOT EXISTS
FOR (n:`PathologyDetail`)
ON (n.`anatomicalSite`);

CREATE INDEX idx_pathology_detail_pathology_method IF NOT EXISTS
FOR (n:`PathologyDetail`)
ON (n.`pathologyMethod`);

CREATE INDEX idx_survival_subject_id IF NOT EXISTS
FOR (n:`Survival`)
ON (n.`subjectId`);

CREATE INDEX idx_survival_survival_type IF NOT EXISTS
FOR (n:`Survival`)
ON (n.`survivalType`);

CREATE INDEX idx_survival_time_origin IF NOT EXISTS
FOR (n:`Survival`)
ON (n.`timeOrigin`);

CREATE INDEX idx_survival_event_type IF NOT EXISTS
FOR (n:`Survival`)
ON (n.`eventType`);

CREATE INDEX idx_survival_event_occurred IF NOT EXISTS
FOR (n:`Survival`)
ON (n.`eventOccurred`);

CREATE INDEX idx_phenotype_observation_subject_id IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
ON (n.`subjectId`);

CREATE INDEX idx_phenotype_observation_sample_id IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
ON (n.`sampleId`);

CREATE INDEX idx_phenotype_observation_diagnosis_id IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
ON (n.`diagnosisId`);

CREATE INDEX idx_phenotype_observation_perturbation_id IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
ON (n.`perturbationId`);

CREATE INDEX idx_phenotype_observation_hpo_id IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
ON (n.`hpoId`);

CREATE INDEX idx_phenotype_observation_phenotype_name IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
ON (n.`phenotypeName`);

CREATE INDEX idx_phenotype_observation_category IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
ON (n.`category`);

CREATE INDEX idx_phenotype_observation_phenotype_type IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
ON (n.`phenotypeType`);

CREATE INDEX idx_phenotype_observation_status IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
ON (n.`status`);

CREATE INDEX idx_phenotype_observation_source_dataset IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
ON (n.`sourceDataset`);

CREATE INDEX idx_phenotype_observation_source_file IF NOT EXISTS
FOR (n:`PhenotypeObservation`)
ON (n.`sourceFile`);

CREATE INDEX idx_gene_symbol IF NOT EXISTS
FOR (n:`Gene`)
ON (n.`symbol`);

CREATE INDEX idx_gene_name IF NOT EXISTS
FOR (n:`Gene`)
ON (n.`name`);

CREATE INDEX idx_gene_organism_taxon_id IF NOT EXISTS
FOR (n:`Gene`)
ON (n.`organismTaxonId`);

CREATE INDEX idx_gene_ensembl_gene_id IF NOT EXISTS
FOR (n:`Gene`)
ON (n.`ensemblGeneId`);

CREATE INDEX idx_gene_hgnc_id IF NOT EXISTS
FOR (n:`Gene`)
ON (n.`hgncId`);

CREATE INDEX idx_gene_entrez_id IF NOT EXISTS
FOR (n:`Gene`)
ON (n.`entrezId`);

CREATE INDEX idx_gene_chromosome IF NOT EXISTS
FOR (n:`Gene`)
ON (n.`chromosome`);

CREATE INDEX idx_gene_strand IF NOT EXISTS
FOR (n:`Gene`)
ON (n.`strand`);

CREATE INDEX idx_variant_variant_class IF NOT EXISTS
FOR (n:`Variant`)
ON (n.`variantClass`);

CREATE INDEX idx_variant_reference_genome IF NOT EXISTS
FOR (n:`Variant`)
ON (n.`referenceGenome`);

CREATE INDEX idx_variant_chromosome IF NOT EXISTS
FOR (n:`Variant`)
ON (n.`chromosome`);

CREATE INDEX idx_variant_position_start IF NOT EXISTS
FOR (n:`Variant`)
ON (n.`positionStart`);

CREATE INDEX idx_variant_position_end IF NOT EXISTS
FOR (n:`Variant`)
ON (n.`positionEnd`);

CREATE INDEX idx_variant_display_name IF NOT EXISTS
FOR (n:`Variant`)
ON (n.`displayName`);

CREATE INDEX idx_variant_gene_id IF NOT EXISTS
FOR (n:`Variant`)
ON (n.`geneId`);

CREATE INDEX idx_variant_region_id IF NOT EXISTS
FOR (n:`Variant`)
ON (n.`regionId`);

CREATE INDEX idx_cp_g_site_chromosome IF NOT EXISTS
FOR (n:`CpGSite`)
ON (n.`chromosome`);

CREATE INDEX idx_cp_g_site_start_position IF NOT EXISTS
FOR (n:`CpGSite`)
ON (n.`startPosition`);

CREATE INDEX idx_cp_g_site_end_position IF NOT EXISTS
FOR (n:`CpGSite`)
ON (n.`endPosition`);

CREATE INDEX idx_cp_g_site_gene_symbol IF NOT EXISTS
FOR (n:`CpGSite`)
ON (n.`geneSymbol`);

CREATE INDEX idx_cp_g_site_ensembl_gene_id IF NOT EXISTS
FOR (n:`CpGSite`)
ON (n.`ensemblGeneId`);

CREATE INDEX idx_cp_g_site_annotation_source IF NOT EXISTS
FOR (n:`CpGSite`)
ON (n.`annotationSource`);

CREATE INDEX idx_cp_g_site_annotation_version IF NOT EXISTS
FOR (n:`CpGSite`)
ON (n.`annotationVersion`);

CREATE INDEX idx_cp_g_site_genome_build IF NOT EXISTS
FOR (n:`CpGSite`)
ON (n.`genomeBuild`);

CREATE INDEX idx_genomic_region_reference_genome IF NOT EXISTS
FOR (n:`GenomicRegion`)
ON (n.`referenceGenome`);

CREATE INDEX idx_genomic_region_chromosome IF NOT EXISTS
FOR (n:`GenomicRegion`)
ON (n.`chromosome`);

CREATE INDEX idx_genomic_region_start IF NOT EXISTS
FOR (n:`GenomicRegion`)
ON (n.`start`);

CREATE INDEX idx_genomic_region_end IF NOT EXISTS
FOR (n:`GenomicRegion`)
ON (n.`end`);

CREATE INDEX idx_genomic_region_name IF NOT EXISTS
FOR (n:`GenomicRegion`)
ON (n.`name`);

CREATE INDEX idx_regulatory_element_element_name IF NOT EXISTS
FOR (n:`RegulatoryElement`)
ON (n.`elementName`);

CREATE INDEX idx_regulatory_element_element_type IF NOT EXISTS
FOR (n:`RegulatoryElement`)
ON (n.`elementType`);

CREATE INDEX idx_regulatory_element_reference_genome IF NOT EXISTS
FOR (n:`RegulatoryElement`)
ON (n.`referenceGenome`);

CREATE INDEX idx_regulatory_element_chromosome IF NOT EXISTS
FOR (n:`RegulatoryElement`)
ON (n.`chromosome`);

CREATE INDEX idx_regulatory_element_start_position IF NOT EXISTS
FOR (n:`RegulatoryElement`)
ON (n.`startPosition`);

CREATE INDEX idx_regulatory_element_end_position IF NOT EXISTS
FOR (n:`RegulatoryElement`)
ON (n.`endPosition`);

CREATE INDEX idx_regulatory_element_coordinate_system IF NOT EXISTS
FOR (n:`RegulatoryElement`)
ON (n.`coordinateSystem`);

CREATE INDEX idx_regulatory_element_element_status IF NOT EXISTS
FOR (n:`RegulatoryElement`)
ON (n.`elementStatus`);

CREATE INDEX idx_regulatory_element_source_database IF NOT EXISTS
FOR (n:`RegulatoryElement`)
ON (n.`sourceDatabase`);

CREATE INDEX idx_regulatory_element_annotation_version IF NOT EXISTS
FOR (n:`RegulatoryElement`)
ON (n.`annotationVersion`);

CREATE INDEX idx_methylation_observation_observation_type IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`observationType`);

CREATE INDEX idx_methylation_observation_sample_id IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`sampleId`);

CREATE INDEX idx_methylation_observation_assay_id IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`assayId`);

CREATE INDEX idx_methylation_observation_cpg_id IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`cpgId`);

CREATE INDEX idx_methylation_observation_methylation_status IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`methylationStatus`);

CREATE INDEX idx_methylation_observation_methylation_status_method IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`methylationStatusMethod`);

CREATE INDEX idx_methylation_observation_modification_type IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`modificationType`);

CREATE INDEX idx_methylation_observation_normalization_method IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`normalizationMethod`);

CREATE INDEX idx_methylation_observation_source_dataset IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`sourceDataset`);

CREATE INDEX idx_methylation_observation_source_file IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`sourceFile`);

CREATE INDEX idx_methylation_observation_pipeline_version IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`pipelineVersion`);

CREATE INDEX idx_methylation_observation_config_key IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`configKey`);

CREATE INDEX idx_methylation_status_rule_rule_name IF NOT EXISTS
FOR (n:`MethylationStatusRule`)
ON (n.`ruleName`);

CREATE INDEX idx_methylation_status_rule_rule_type IF NOT EXISTS
FOR (n:`MethylationStatusRule`)
ON (n.`ruleType`);

CREATE INDEX idx_methylation_status_rule_beta_value_scale IF NOT EXISTS
FOR (n:`MethylationStatusRule`)
ON (n.`betaValueScale`);

CREATE INDEX idx_methylation_status_rule_source_publication_id IF NOT EXISTS
FOR (n:`MethylationStatusRule`)
ON (n.`sourcePublicationId`);

CREATE INDEX idx_variant_observation_sample_id IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`sampleId`);

CREATE INDEX idx_variant_observation_assay_id IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`assayId`);

CREATE INDEX idx_variant_observation_variant_id IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`variantId`);

CREATE INDEX idx_variant_observation_variant_caller IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`variantCaller`);

CREATE INDEX idx_variant_observation_call_status IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`callStatus`);

CREATE INDEX idx_variant_observation_somatic_status IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`somaticStatus`);

CREATE INDEX idx_variant_observation_zygosity IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`zygosity`);

CREATE INDEX idx_variant_observation_clinical_significance IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`clinicalSignificance`);

CREATE INDEX idx_variant_observation_filter_status IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`filterStatus`);

CREATE INDEX idx_variant_observation_source_dataset IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`sourceDataset`);

CREATE INDEX idx_variant_observation_source_file IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`sourceFile`);

CREATE INDEX idx_expression_observation_sample_id IF NOT EXISTS
FOR (n:`ExpressionObservation`)
ON (n.`sampleId`);

CREATE INDEX idx_expression_observation_assay_id IF NOT EXISTS
FOR (n:`ExpressionObservation`)
ON (n.`assayId`);

CREATE INDEX idx_expression_observation_gene_id IF NOT EXISTS
FOR (n:`ExpressionObservation`)
ON (n.`geneId`);

CREATE INDEX idx_expression_observation_observation_type IF NOT EXISTS
FOR (n:`ExpressionObservation`)
ON (n.`observationType`);

CREATE INDEX idx_expression_observation_expression_unit IF NOT EXISTS
FOR (n:`ExpressionObservation`)
ON (n.`expressionUnit`);

CREATE INDEX idx_expression_observation_normalization_method IF NOT EXISTS
FOR (n:`ExpressionObservation`)
ON (n.`normalizationMethod`);

CREATE INDEX idx_expression_observation_source_dataset IF NOT EXISTS
FOR (n:`ExpressionObservation`)
ON (n.`sourceDataset`);

CREATE INDEX idx_expression_observation_source_file IF NOT EXISTS
FOR (n:`ExpressionObservation`)
ON (n.`sourceFile`);

CREATE INDEX idx_expression_observation_pipeline_version IF NOT EXISTS
FOR (n:`ExpressionObservation`)
ON (n.`pipelineVersion`);

CREATE INDEX idx_expression_observation_config_key IF NOT EXISTS
FOR (n:`ExpressionObservation`)
ON (n.`configKey`);

CREATE INDEX idx_protein_observation_sample_id IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`sampleId`);

CREATE INDEX idx_protein_observation_assay_id IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`assayId`);

CREATE INDEX idx_protein_observation_protein_id IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`proteinId`);

CREATE INDEX idx_protein_observation_observation_type IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`observationType`);

CREATE INDEX idx_protein_observation_expression_unit IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`expressionUnit`);

CREATE INDEX idx_protein_observation_detection_status IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`detectionStatus`);

CREATE INDEX idx_protein_observation_quantification_method IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`quantificationMethod`);

CREATE INDEX idx_protein_observation_normalization_method IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`normalizationMethod`);

CREATE INDEX idx_protein_observation_source_dataset IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`sourceDataset`);

CREATE INDEX idx_protein_observation_source_file IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`sourceFile`);

CREATE INDEX idx_protein_observation_config_key IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`configKey`);

CREATE INDEX idx_metabolite_observation_sample_id IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`sampleId`);

CREATE INDEX idx_metabolite_observation_assay_id IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`assayId`);

CREATE INDEX idx_metabolite_observation_metabolite_id IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`metaboliteId`);

CREATE INDEX idx_metabolite_observation_observation_type IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`observationType`);

CREATE INDEX idx_metabolite_observation_abundance_unit IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`abundanceUnit`);

CREATE INDEX idx_metabolite_observation_detection_status IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`detectionStatus`);

CREATE INDEX idx_metabolite_observation_quantification_method IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`quantificationMethod`);

CREATE INDEX idx_metabolite_observation_normalization_method IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`normalizationMethod`);

CREATE INDEX idx_metabolite_observation_source_dataset IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`sourceDataset`);

CREATE INDEX idx_metabolite_observation_source_file IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`sourceFile`);

CREATE INDEX idx_metabolite_observation_config_key IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`configKey`);

CREATE INDEX idx_protein_uniprot_id IF NOT EXISTS
FOR (n:`Protein`)
ON (n.`uniprotId`);

CREATE INDEX idx_protein_protein_name IF NOT EXISTS
FOR (n:`Protein`)
ON (n.`proteinName`);

CREATE INDEX idx_protein_gene_id IF NOT EXISTS
FOR (n:`Protein`)
ON (n.`geneId`);

CREATE INDEX idx_protein_organism_taxon_id IF NOT EXISTS
FOR (n:`Protein`)
ON (n.`organismTaxonId`);

CREATE INDEX idx_protein_source_database IF NOT EXISTS
FOR (n:`Protein`)
ON (n.`sourceDatabase`);

CREATE INDEX idx_protein_annotation_version IF NOT EXISTS
FOR (n:`Protein`)
ON (n.`annotationVersion`);

CREATE INDEX idx_metabolite_metabolite_name IF NOT EXISTS
FOR (n:`Metabolite`)
ON (n.`metaboliteName`);

CREATE INDEX idx_metabolite_hmdb_id IF NOT EXISTS
FOR (n:`Metabolite`)
ON (n.`hmdbId`);

CREATE INDEX idx_metabolite_kegg_id IF NOT EXISTS
FOR (n:`Metabolite`)
ON (n.`keggId`);

CREATE INDEX idx_metabolite_chebi_id IF NOT EXISTS
FOR (n:`Metabolite`)
ON (n.`chebiId`);

CREATE INDEX idx_pathway_pathway_name IF NOT EXISTS
FOR (n:`Pathway`)
ON (n.`pathwayName`);

CREATE INDEX idx_pathway_organism_taxon_id IF NOT EXISTS
FOR (n:`Pathway`)
ON (n.`organismTaxonId`);

CREATE INDEX idx_pathway_ontology_id IF NOT EXISTS
FOR (n:`Pathway`)
ON (n.`ontologyId`);

CREATE INDEX idx_pathway_source_vocabulary IF NOT EXISTS
FOR (n:`Pathway`)
ON (n.`sourceVocabulary`);

CREATE INDEX idx_pathway_pathway_type IF NOT EXISTS
FOR (n:`Pathway`)
ON (n.`pathwayType`);

CREATE INDEX idx_pathway_annotation_version IF NOT EXISTS
FOR (n:`Pathway`)
ON (n.`annotationVersion`);

CREATE INDEX idx_evidence_publication_id IF NOT EXISTS
FOR (n:`Evidence`)
ON (n.`publicationId`);

CREATE INDEX idx_evidence_evidence_type IF NOT EXISTS
FOR (n:`Evidence`)
ON (n.`evidenceType`);

CREATE INDEX idx_evidence_evidence_level IF NOT EXISTS
FOR (n:`Evidence`)
ON (n.`evidenceLevel`);

CREATE INDEX idx_evidence_evidence_scope IF NOT EXISTS
FOR (n:`Evidence`)
ON (n.`evidenceScope`);

CREATE INDEX idx_evidence_association_type IF NOT EXISTS
FOR (n:`Evidence`)
ON (n.`associationType`);

CREATE INDEX idx_evidence_extraction_method IF NOT EXISTS
FOR (n:`Evidence`)
ON (n.`extractionMethod`);

CREATE INDEX idx_evidence_source_file IF NOT EXISTS
FOR (n:`Evidence`)
ON (n.`sourceFile`);

CREATE INDEX idx_evidence_source_database IF NOT EXISTS
FOR (n:`Evidence`)
ON (n.`sourceDatabase`);

CREATE INDEX idx_intervention_sample_id IF NOT EXISTS
FOR (n:`Intervention`)
ON (n.`sampleId`);

CREATE INDEX idx_intervention_intervention_name IF NOT EXISTS
FOR (n:`Intervention`)
ON (n.`interventionName`);

CREATE INDEX idx_intervention_intervention_type IF NOT EXISTS
FOR (n:`Intervention`)
ON (n.`interventionType`);

CREATE INDEX idx_intervention_intervention_subtype IF NOT EXISTS
FOR (n:`Intervention`)
ON (n.`interventionSubtype`);

CREATE INDEX idx_intervention_intent_type IF NOT EXISTS
FOR (n:`Intervention`)
ON (n.`intentType`);

CREATE INDEX idx_intervention_status IF NOT EXISTS
FOR (n:`Intervention`)
ON (n.`status`);

CREATE INDEX idx_intervention_source_dataset IF NOT EXISTS
FOR (n:`Intervention`)
ON (n.`sourceDataset`);

CREATE INDEX idx_intervention_source_file IF NOT EXISTS
FOR (n:`Intervention`)
ON (n.`sourceFile`);

CREATE INDEX idx_drug_regimen_name IF NOT EXISTS
FOR (n:`Drug`)
ON (n.`regimenName`);

CREATE INDEX idx_drug_line_of_therapy IF NOT EXISTS
FOR (n:`Drug`)
ON (n.`lineOfTherapy`);

CREATE INDEX idx_drug_route_of_administration IF NOT EXISTS
FOR (n:`Drug`)
ON (n.`routeOfAdministration`);

CREATE INDEX idx_drug_combination_therapy_flag IF NOT EXISTS
FOR (n:`Drug`)
ON (n.`combinationTherapyFlag`);

CREATE INDEX idx_radiation_radiation_type IF NOT EXISTS
FOR (n:`Radiation`)
ON (n.`radiationType`);

CREATE INDEX idx_radiation_target_site IF NOT EXISTS
FOR (n:`Radiation`)
ON (n.`targetSite`);

CREATE INDEX idx_radiation_radiation_technique IF NOT EXISTS
FOR (n:`Radiation`)
ON (n.`radiationTechnique`);

CREATE INDEX idx_immunotherapy_immunotherapy_type IF NOT EXISTS
FOR (n:`Immunotherapy`)
ON (n.`immunotherapyType`);

CREATE INDEX idx_immunotherapy_checkpoint_target IF NOT EXISTS
FOR (n:`Immunotherapy`)
ON (n.`checkpointTarget`);

CREATE INDEX idx_immunotherapy_immune_target IF NOT EXISTS
FOR (n:`Immunotherapy`)
ON (n.`immuneTarget`);

CREATE INDEX idx_immunotherapy_cell_therapy_type IF NOT EXISTS
FOR (n:`Immunotherapy`)
ON (n.`cellTherapyType`);

CREATE INDEX idx_immunotherapy_vaccine_type IF NOT EXISTS
FOR (n:`Immunotherapy`)
ON (n.`vaccineType`);

CREATE INDEX idx_immunotherapy_biomarker_requirement IF NOT EXISTS
FOR (n:`Immunotherapy`)
ON (n.`biomarkerRequirement`);

CREATE INDEX idx_surgery_anatomical_site IF NOT EXISTS
FOR (n:`Surgery`)
ON (n.`anatomicalSite`);

CREATE INDEX idx_surgery_laterality IF NOT EXISTS
FOR (n:`Surgery`)
ON (n.`laterality`);

CREATE INDEX idx_surgery_surgery_type IF NOT EXISTS
FOR (n:`Surgery`)
ON (n.`surgeryType`);

CREATE INDEX idx_surgery_resection_status IF NOT EXISTS
FOR (n:`Surgery`)
ON (n.`resectionStatus`);

CREATE INDEX idx_surgery_margin_status IF NOT EXISTS
FOR (n:`Surgery`)
ON (n.`marginStatus`);

CREATE INDEX idx_therapy_therapy_type IF NOT EXISTS
FOR (n:`Therapy`)
ON (n.`therapyType`);

CREATE INDEX idx_therapy_therapy_focus_area IF NOT EXISTS
FOR (n:`Therapy`)
ON (n.`therapyFocusArea`);

CREATE INDEX idx_therapy_provider_type IF NOT EXISTS
FOR (n:`Therapy`)
ON (n.`providerType`);

CREATE INDEX idx_exposure_exposure_type IF NOT EXISTS
FOR (n:`Exposure`)
ON (n.`exposureType`);

CREATE INDEX idx_exposure_exposure_route IF NOT EXISTS
FOR (n:`Exposure`)
ON (n.`exposureRoute`);

CREATE INDEX idx_exposure_exposure_setting IF NOT EXISTS
FOR (n:`Exposure`)
ON (n.`exposureSetting`);

CREATE INDEX idx_exposure_exposure_frequency IF NOT EXISTS
FOR (n:`Exposure`)
ON (n.`exposureFrequency`);

CREATE INDEX idx_chemical_entity_name IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON (n.`name`);

CREATE INDEX idx_chemical_entity_generic_name IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON (n.`genericName`);

CREATE INDEX idx_chemical_entity_brand_name IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON (n.`brandName`);

CREATE INDEX idx_chemical_entity_chemical_class IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON (n.`chemicalClass`);

CREATE INDEX idx_chemical_entity_mechanism_of_action IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON (n.`mechanismOfAction`);

CREATE INDEX idx_chemical_entity_drug_bank_id IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON (n.`drugBankId`);

CREATE INDEX idx_chemical_entity_chembl_id IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON (n.`chemblId`);

CREATE INDEX idx_chemical_entity_pub_chem_cid IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON (n.`pubChemCid`);

CREATE INDEX idx_chemical_entity_rx_norm_code IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON (n.`rxNormCode`);

CREATE INDEX idx_chemical_entity_agent_category IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON (n.`agentCategory`);

CREATE INDEX idx_chemical_entity_source_database IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON (n.`sourceDatabase`);

CREATE INDEX idx_procedure_procedure_name IF NOT EXISTS
FOR (n:`Procedure`)
ON (n.`procedureName`);

CREATE INDEX idx_procedure_procedure_code IF NOT EXISTS
FOR (n:`Procedure`)
ON (n.`procedureCode`);

CREATE INDEX idx_procedure_procedure_code_system IF NOT EXISTS
FOR (n:`Procedure`)
ON (n.`procedureCodeSystem`);

CREATE INDEX idx_procedure_procedure_type IF NOT EXISTS
FOR (n:`Procedure`)
ON (n.`procedureType`);

CREATE INDEX idx_procedure_source_vocabulary IF NOT EXISTS
FOR (n:`Procedure`)
ON (n.`sourceVocabulary`);

CREATE INDEX idx_procedure_source_database IF NOT EXISTS
FOR (n:`Procedure`)
ON (n.`sourceDatabase`);

CREATE INDEX idx_perturbation_sample_id IF NOT EXISTS
FOR (n:`Perturbation`)
ON (n.`sampleId`);

CREATE INDEX idx_perturbation_perturbation_name IF NOT EXISTS
FOR (n:`Perturbation`)
ON (n.`perturbationName`);

CREATE INDEX idx_perturbation_perturbation_type IF NOT EXISTS
FOR (n:`Perturbation`)
ON (n.`perturbationType`);

CREATE INDEX idx_perturbation_perturbation_method IF NOT EXISTS
FOR (n:`Perturbation`)
ON (n.`perturbationMethod`);

CREATE INDEX idx_perturbation_confirmation_status IF NOT EXISTS
FOR (n:`Perturbation`)
ON (n.`confirmationStatus`);

CREATE INDEX idx_perturbation_source_dataset IF NOT EXISTS
FOR (n:`Perturbation`)
ON (n.`sourceDataset`);

CREATE INDEX idx_perturbation_source_file IF NOT EXISTS
FOR (n:`Perturbation`)
ON (n.`sourceFile`);

CREATE INDEX idx_perturbation_source_record_id IF NOT EXISTS
FOR (n:`Perturbation`)
ON (n.`sourceRecordId`);

CREATE INDEX idx_perturbation_config_key IF NOT EXISTS
FOR (n:`Perturbation`)
ON (n.`configKey`);

CREATE INDEX idx_repository_repository_name IF NOT EXISTS
FOR (n:`Repository`)
ON (n.`repositoryName`);

CREATE INDEX idx_repository_curation_level IF NOT EXISTS
FOR (n:`Repository`)
ON (n.`curationLevel`);

CREATE INDEX idx_repository_url IF NOT EXISTS
FOR (n:`Repository`)
ON (n.`url`);

CREATE INDEX idx_repository_data_access_level IF NOT EXISTS
FOR (n:`Repository`)
ON (n.`dataAccessLevel`);

CREATE INDEX idx_single_cell_dataset_dataset_title IF NOT EXISTS
FOR (n:`SingleCellDataset`)
ON (n.`datasetTitle`);

CREATE INDEX idx_single_cell_dataset_repository_dataset_id IF NOT EXISTS
FOR (n:`SingleCellDataset`)
ON (n.`repositoryDatasetId`);

CREATE INDEX idx_single_cell_dataset_modality IF NOT EXISTS
FOR (n:`SingleCellDataset`)
ON (n.`modality`);

CREATE INDEX idx_single_cell_dataset_dataset_version IF NOT EXISTS
FOR (n:`SingleCellDataset`)
ON (n.`datasetVersion`);

CREATE INDEX idx_single_cell_dataset_data_access_level IF NOT EXISTS
FOR (n:`SingleCellDataset`)
ON (n.`dataAccessLevel`);

CREATE INDEX idx_single_cell_dataset_license IF NOT EXISTS
FOR (n:`SingleCellDataset`)
ON (n.`license`);

CREATE INDEX idx_single_cell_dataset_source_dataset IF NOT EXISTS
FOR (n:`SingleCellDataset`)
ON (n.`sourceDataset`);

CREATE INDEX idx_cell_set_cell_set_type IF NOT EXISTS
FOR (n:`CellSet`)
ON (n.`cellSetType`);

CREATE INDEX idx_cell_set_source_cluster_id IF NOT EXISTS
FOR (n:`CellSet`)
ON (n.`sourceClusterId`);

CREATE INDEX idx_cell_set_source_cell_type_label IF NOT EXISTS
FOR (n:`CellSet`)
ON (n.`sourceCellTypeLabel`);

CREATE INDEX idx_cell_set_source_annotation_field IF NOT EXISTS
FOR (n:`CellSet`)
ON (n.`sourceAnnotationField`);

CREATE INDEX idx_cell_set_source_annotation_value IF NOT EXISTS
FOR (n:`CellSet`)
ON (n.`sourceAnnotationValue`);

CREATE INDEX idx_cell_type_cell_type_name IF NOT EXISTS
FOR (n:`CellType`)
ON (n.`cellTypeName`);

CREATE INDEX idx_cell_state_cell_state_name IF NOT EXISTS
FOR (n:`CellState`)
ON (n.`cellStateName`);

CREATE INDEX idx_feature_feature_name IF NOT EXISTS
FOR (n:`Feature`)
ON (n.`featureName`);

CREATE INDEX idx_feature_feature_type IF NOT EXISTS
FOR (n:`Feature`)
ON (n.`featureType`);

// -----------------------------------------------------------------------------
// 3. Composite genomic and frequent-query indexes
// -----------------------------------------------------------------------------

CREATE INDEX idx_gene_genomic_coordinates IF NOT EXISTS
FOR (n:`Gene`)
ON (n.`chromosome`, n.`startPosition`, n.`endPosition`);

CREATE INDEX idx_variant_genomic_coordinates IF NOT EXISTS
FOR (n:`Variant`)
ON (n.`referenceGenome`, n.`chromosome`, n.`positionStart`, n.`positionEnd`);

CREATE INDEX idx_cpgsite_genomic_coordinates IF NOT EXISTS
FOR (n:`CpGSite`)
ON (n.`genomeBuild`, n.`chromosome`, n.`startPosition`, n.`endPosition`);

CREATE INDEX idx_genomicregion_coordinates IF NOT EXISTS
FOR (n:`GenomicRegion`)
ON (n.`referenceGenome`, n.`chromosome`, n.`start`, n.`end`);

CREATE INDEX idx_regulatoryelement_coordinates IF NOT EXISTS
FOR (n:`RegulatoryElement`)
ON (n.`referenceGenome`, n.`chromosome`, n.`startPosition`, n.`endPosition`);

CREATE INDEX idx_sample_dataset_class IF NOT EXISTS
FOR (n:`Sample`)
ON (n.`sourceDataset`, n.`sampleClass`);

CREATE INDEX idx_methylationobs_sample_cpg IF NOT EXISTS
FOR (n:`MethylationObservation`)
ON (n.`sampleId`, n.`cpgId`);

CREATE INDEX idx_expressionobs_sample_gene IF NOT EXISTS
FOR (n:`ExpressionObservation`)
ON (n.`sampleId`, n.`geneId`);

CREATE INDEX idx_variantobs_sample_variant IF NOT EXISTS
FOR (n:`VariantObservation`)
ON (n.`sampleId`, n.`variantId`);

CREATE INDEX idx_proteinobs_sample_protein IF NOT EXISTS
FOR (n:`ProteinObservation`)
ON (n.`sampleId`, n.`proteinId`);

CREATE INDEX idx_metaboliteobs_sample_metabolite IF NOT EXISTS
FOR (n:`MetaboliteObservation`)
ON (n.`sampleId`, n.`metaboliteId`);

CREATE INDEX idx_cellset_source_annotation IF NOT EXISTS
FOR (n:`CellSet`)
ON (n.`sourceAnnotationField`, n.`sourceAnnotationValue`);

// -----------------------------------------------------------------------------
// 4. Relationship property indexes
// -----------------------------------------------------------------------------

CREATE INDEX idx_rel_p_a_i_r_e_d_w_i_t_h_pairing_type IF NOT EXISTS
FOR ()-[r:`PAIRED_WITH`]-()
ON (r.`pairingType`);

CREATE INDEX idx_rel_p_a_i_r_e_d_w_i_t_h_reference_role IF NOT EXISTS
FOR ()-[r:`PAIRED_WITH`]-()
ON (r.`referenceRole`);

CREATE INDEX idx_rel_h_a_s_c_o_n_d_i_t_i_o_n_condition_role IF NOT EXISTS
FOR ()-[r:`HAS_CONDITION`]-()
ON (r.`conditionRole`);

CREATE INDEX idx_rel_h_a_s_p_h_e_n_o_t_y_p_e_o_b_s_e_r_v_a_t_i_o_n_days_to_event IF NOT EXISTS
FOR ()-[r:`HAS_PHENOTYPE_OBSERVATION`]-()
ON (r.`daysToEvent`);

CREATE INDEX idx_rel_h_a_s_d_i_a_g_n_o_s_i_s_temporal_order IF NOT EXISTS
FOR ()-[r:`HAS_DIAGNOSIS`]-()
ON (r.`temporalOrder`);

CREATE INDEX idx_rel_h_a_s_d_i_a_g_n_o_s_i_s_is_primary_diagnosis IF NOT EXISTS
FOR ()-[r:`HAS_DIAGNOSIS`]-()
ON (r.`isPrimaryDiagnosis`);

CREATE INDEX idx_rel_h_a_s_d_i_a_g_n_o_s_i_s_confidence_score IF NOT EXISTS
FOR ()-[r:`HAS_DIAGNOSIS`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_o_f_d_i_s_e_a_s_e_mapping_method IF NOT EXISTS
FOR ()-[r:`OF_DISEASE`]-()
ON (r.`mappingMethod`);

CREATE INDEX idx_rel_o_f_d_i_s_e_a_s_e_ontology_mapping_status IF NOT EXISTS
FOR ()-[r:`OF_DISEASE`]-()
ON (r.`ontologyMappingStatus`);

CREATE INDEX idx_rel_o_f_d_i_s_e_a_s_e_confidence_score IF NOT EXISTS
FOR ()-[r:`OF_DISEASE`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_h_a_s_p_a_t_h_o_l_o_g_y_pathology_role IF NOT EXISTS
FOR ()-[r:`HAS_PATHOLOGY`]-()
ON (r.`pathologyRole`);

CREATE INDEX idx_rel_h_a_s_p_a_t_h_o_l_o_g_y_evidence_type IF NOT EXISTS
FOR ()-[r:`HAS_PATHOLOGY`]-()
ON (r.`evidenceType`);

CREATE INDEX idx_rel_h_a_s_p_a_t_h_o_l_o_g_y_specimen_basis IF NOT EXISTS
FOR ()-[r:`HAS_PATHOLOGY`]-()
ON (r.`specimenBasis`);

CREATE INDEX idx_rel_h_a_s_s_u_r_v_i_v_a_l_r_e_c_o_r_d_endpoint_role IF NOT EXISTS
FOR ()-[r:`HAS_SURVIVAL_RECORD`]-()
ON (r.`endpointRole`);

CREATE INDEX idx_rel_h_a_s_s_u_r_v_i_v_a_l_r_e_c_o_r_d_confidence_score IF NOT EXISTS
FOR ()-[r:`HAS_SURVIVAL_RECORD`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_a_s_s_a_y_e_d_b_y_assay_role IF NOT EXISTS
FOR ()-[r:`ASSAYED_BY`]-()
ON (r.`assayRole`);

CREATE INDEX idx_rel_u_s_e_d_l_i_b_r_a_r_y_protocol_source IF NOT EXISTS
FOR ()-[r:`USED_LIBRARY`]-()
ON (r.`protocolSource`);

CREATE INDEX idx_rel_u_s_e_d_l_i_b_r_a_r_y_chemistry_version IF NOT EXISTS
FOR ()-[r:`USED_LIBRARY`]-()
ON (r.`chemistryVersion`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_c_p_g_mapping_confidence IF NOT EXISTS
FOR ()-[r:`MEASURES_CPG`]-()
ON (r.`mappingConfidence`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_g_e_n_e_functional_domain IF NOT EXISTS
FOR ()-[r:`MEASURES_GENE`]-()
ON (r.`functionalDomain`);

CREATE INDEX idx_rel_o_b_s_e_r_v_e_d_v_a_r_i_a_n_t_mapping_confidence IF NOT EXISTS
FOR ()-[r:`OBSERVED_VARIANT`]-()
ON (r.`mappingConfidence`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_p_r_o_t_e_i_n_mapping_method IF NOT EXISTS
FOR ()-[r:`MEASURES_PROTEIN`]-()
ON (r.`mappingMethod`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_p_r_o_t_e_i_n_source_protein_identifier IF NOT EXISTS
FOR ()-[r:`MEASURES_PROTEIN`]-()
ON (r.`sourceProteinIdentifier`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_p_r_o_t_e_i_n_annotation_source IF NOT EXISTS
FOR ()-[r:`MEASURES_PROTEIN`]-()
ON (r.`annotationSource`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_p_r_o_t_e_i_n_annotation_version IF NOT EXISTS
FOR ()-[r:`MEASURES_PROTEIN`]-()
ON (r.`annotationVersion`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_p_r_o_t_e_i_n_confidence_score IF NOT EXISTS
FOR ()-[r:`MEASURES_PROTEIN`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_m_e_t_a_b_o_l_i_t_e_mapping_method IF NOT EXISTS
FOR ()-[r:`MEASURES_METABOLITE`]-()
ON (r.`mappingMethod`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_m_e_t_a_b_o_l_i_t_e_source_metabolite_identifier IF NOT EXISTS
FOR ()-[r:`MEASURES_METABOLITE`]-()
ON (r.`sourceMetaboliteIdentifier`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_m_e_t_a_b_o_l_i_t_e_annotation_source IF NOT EXISTS
FOR ()-[r:`MEASURES_METABOLITE`]-()
ON (r.`annotationSource`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_m_e_t_a_b_o_l_i_t_e_annotation_version IF NOT EXISTS
FOR ()-[r:`MEASURES_METABOLITE`]-()
ON (r.`annotationVersion`);

CREATE INDEX idx_rel_m_e_a_s_u_r_e_s_m_e_t_a_b_o_l_i_t_e_confidence_score IF NOT EXISTS
FOR ()-[r:`MEASURES_METABOLITE`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_r_e_g_u_l_a_t_e_s_g_e_n_e_evidence_level IF NOT EXISTS
FOR ()-[r:`REGULATES_GENE`]-()
ON (r.`evidenceLevel`);

CREATE INDEX idx_rel_r_e_g_u_l_a_t_e_s_g_e_n_e_regulatory_type IF NOT EXISTS
FOR ()-[r:`REGULATES_GENE`]-()
ON (r.`regulatoryType`);

CREATE INDEX idx_rel_r_e_g_u_l_a_t_e_s_g_e_n_e_confidence_score IF NOT EXISTS
FOR ()-[r:`REGULATES_GENE`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_r_e_g_u_l_a_t_e_s_g_e_n_e_tissue_context IF NOT EXISTS
FOR ()-[r:`REGULATES_GENE`]-()
ON (r.`tissueContext`);

CREATE INDEX idx_rel_i_s_w_i_t_h_i_n_g_e_n_e_gene_region IF NOT EXISTS
FOR ()-[r:`IS_WITHIN_GENE`]-()
ON (r.`geneRegion`);

CREATE INDEX idx_rel_i_s_w_i_t_h_i_n_g_e_n_e_transcript_id IF NOT EXISTS
FOR ()-[r:`IS_WITHIN_GENE`]-()
ON (r.`transcriptId`);

CREATE INDEX idx_rel_i_s_w_i_t_h_i_n_g_e_n_e_annotation_source IF NOT EXISTS
FOR ()-[r:`IS_WITHIN_GENE`]-()
ON (r.`annotationSource`);

CREATE INDEX idx_rel_m_a_p_s_t_o_g_e_n_e_mapping_method IF NOT EXISTS
FOR ()-[r:`MAPS_TO_GENE`]-()
ON (r.`mappingMethod`);

CREATE INDEX idx_rel_m_a_p_s_t_o_g_e_n_e_gene_context IF NOT EXISTS
FOR ()-[r:`MAPS_TO_GENE`]-()
ON (r.`geneContext`);

CREATE INDEX idx_rel_m_a_p_s_t_o_g_e_n_e_annotation_source IF NOT EXISTS
FOR ()-[r:`MAPS_TO_GENE`]-()
ON (r.`annotationSource`);

CREATE INDEX idx_rel_m_a_p_s_t_o_g_e_n_e_confidence_score IF NOT EXISTS
FOR ()-[r:`MAPS_TO_GENE`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_l_o_c_a_t_e_d_i_n_r_e_g_i_o_n_overlap_percentage IF NOT EXISTS
FOR ()-[r:`LOCATED_IN_REGION`]-()
ON (r.`overlapPercentage`);

CREATE INDEX idx_rel_a_s_s_o_c_i_a_t_e_d_w_i_t_h_g_e_n_e_association_type IF NOT EXISTS
FOR ()-[r:`ASSOCIATED_WITH_GENE`]-()
ON (r.`associationType`);

CREATE INDEX idx_rel_a_s_s_o_c_i_a_t_e_d_w_i_t_h_g_e_n_e_relative_position IF NOT EXISTS
FOR ()-[r:`ASSOCIATED_WITH_GENE`]-()
ON (r.`relativePosition`);

CREATE INDEX idx_rel_a_s_s_o_c_i_a_t_e_d_w_i_t_h_g_e_n_e_reference_genome IF NOT EXISTS
FOR ()-[r:`ASSOCIATED_WITH_GENE`]-()
ON (r.`referenceGenome`);

CREATE INDEX idx_rel_a_s_s_o_c_i_a_t_e_d_w_i_t_h_g_e_n_e_annotation_source IF NOT EXISTS
FOR ()-[r:`ASSOCIATED_WITH_GENE`]-()
ON (r.`annotationSource`);

CREATE INDEX idx_rel_a_s_s_o_c_i_a_t_e_d_w_i_t_h_g_e_n_e_confidence_score IF NOT EXISTS
FOR ()-[r:`ASSOCIATED_WITH_GENE`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_h_a_s_r_e_g_u_l_a_t_o_r_y_e_l_e_m_e_n_t_element_role IF NOT EXISTS
FOR ()-[r:`HAS_REGULATORY_ELEMENT`]-()
ON (r.`elementRole`);

CREATE INDEX idx_rel_h_a_s_r_e_g_u_l_a_t_o_r_y_e_l_e_m_e_n_t_activity_status IF NOT EXISTS
FOR ()-[r:`HAS_REGULATORY_ELEMENT`]-()
ON (r.`activityStatus`);

CREATE INDEX idx_rel_h_a_s_r_e_g_u_l_a_t_o_r_y_e_l_e_m_e_n_t_evidence_type IF NOT EXISTS
FOR ()-[r:`HAS_REGULATORY_ELEMENT`]-()
ON (r.`evidenceType`);

CREATE INDEX idx_rel_h_a_s_r_e_g_u_l_a_t_o_r_y_e_l_e_m_e_n_t_assay_id IF NOT EXISTS
FOR ()-[r:`HAS_REGULATORY_ELEMENT`]-()
ON (r.`assayId`);

CREATE INDEX idx_rel_h_a_s_r_e_g_u_l_a_t_o_r_y_e_l_e_m_e_n_t_confidence_score IF NOT EXISTS
FOR ()-[r:`HAS_REGULATORY_ELEMENT`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_e_n_c_o_d_e_s_mapping_method IF NOT EXISTS
FOR ()-[r:`ENCODES`]-()
ON (r.`mappingMethod`);

CREATE INDEX idx_rel_e_n_c_o_d_e_s_isoform_role IF NOT EXISTS
FOR ()-[r:`ENCODES`]-()
ON (r.`isoformRole`);

CREATE INDEX idx_rel_e_n_c_o_d_e_s_transcript_id IF NOT EXISTS
FOR ()-[r:`ENCODES`]-()
ON (r.`transcriptId`);

CREATE INDEX idx_rel_e_n_c_o_d_e_s_confidence_score IF NOT EXISTS
FOR ()-[r:`ENCODES`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_p_a_r_t_i_c_i_p_a_t_e_s_i_n_p_a_t_h_w_a_y_participation_role IF NOT EXISTS
FOR ()-[r:`PARTICIPATES_IN_PATHWAY`]-()
ON (r.`participationRole`);

CREATE INDEX idx_rel_p_a_r_t_i_c_i_p_a_t_e_s_i_n_p_a_t_h_w_a_y_evidence_code IF NOT EXISTS
FOR ()-[r:`PARTICIPATES_IN_PATHWAY`]-()
ON (r.`evidenceCode`);

CREATE INDEX idx_rel_p_a_r_t_i_c_i_p_a_t_e_s_i_n_p_a_t_h_w_a_y_confidence_score IF NOT EXISTS
FOR ()-[r:`PARTICIPATES_IN_PATHWAY`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_m_o_d_u_l_a_t_e_s_r_e_g_u_l_a_t_i_o_n_o_f_evidence_type IF NOT EXISTS
FOR ()-[r:`MODULATES_REGULATION_OF`]-()
ON (r.`evidenceType`);

CREATE INDEX idx_rel_m_o_d_u_l_a_t_e_s_r_e_g_u_l_a_t_i_o_n_o_f_evidence_level IF NOT EXISTS
FOR ()-[r:`MODULATES_REGULATION_OF`]-()
ON (r.`evidenceLevel`);

CREATE INDEX idx_rel_m_o_d_u_l_a_t_e_s_r_e_g_u_l_a_t_i_o_n_o_f_source_database IF NOT EXISTS
FOR ()-[r:`MODULATES_REGULATION_OF`]-()
ON (r.`sourceDatabase`);

CREATE INDEX idx_rel_m_o_d_u_l_a_t_e_s_r_e_g_u_l_a_t_i_o_n_o_f_mechanism IF NOT EXISTS
FOR ()-[r:`MODULATES_REGULATION_OF`]-()
ON (r.`mechanism`);

CREATE INDEX idx_rel_m_o_d_u_l_a_t_e_s_r_e_g_u_l_a_t_i_o_n_o_f_confidence_score IF NOT EXISTS
FOR ()-[r:`MODULATES_REGULATION_OF`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_p_r_o_v_i_d_e_s_e_v_i_d_e_n_c_e_f_o_r_source_role IF NOT EXISTS
FOR ()-[r:`PROVIDES_EVIDENCE_FOR`]-()
ON (r.`sourceRole`);

CREATE INDEX idx_rel_p_r_o_v_i_d_e_s_e_v_i_d_e_n_c_e_f_o_r_extraction_status IF NOT EXISTS
FOR ()-[r:`PROVIDES_EVIDENCE_FOR`]-()
ON (r.`extractionStatus`);

CREATE INDEX idx_rel_p_r_o_v_i_d_e_s_e_v_i_d_e_n_c_e_f_o_r_confidence_score IF NOT EXISTS
FOR ()-[r:`PROVIDES_EVIDENCE_FOR`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_s_u_p_p_o_r_t_s_a_s_s_o_c_i_a_t_i_o_n_w_i_t_h_entity_role IF NOT EXISTS
FOR ()-[r:`SUPPORTS_ASSOCIATION_WITH`]-()
ON (r.`entityRole`);

CREATE INDEX idx_rel_s_u_p_p_o_r_t_s_a_s_s_o_c_i_a_t_i_o_n_w_i_t_h_support_direction IF NOT EXISTS
FOR ()-[r:`SUPPORTS_ASSOCIATION_WITH`]-()
ON (r.`supportDirection`);

CREATE INDEX idx_rel_s_u_p_p_o_r_t_s_a_s_s_o_c_i_a_t_i_o_n_w_i_t_h_mapping_method IF NOT EXISTS
FOR ()-[r:`SUPPORTS_ASSOCIATION_WITH`]-()
ON (r.`mappingMethod`);

CREATE INDEX idx_rel_s_u_p_p_o_r_t_s_a_s_s_o_c_i_a_t_i_o_n_w_i_t_h_confidence_score IF NOT EXISTS
FOR ()-[r:`SUPPORTS_ASSOCIATION_WITH`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_h_o_s_t_s_d_a_t_a_s_e_t_repository_dataset_id IF NOT EXISTS
FOR ()-[r:`HOSTS_DATASET`]-()
ON (r.`repositoryDatasetId`);

CREATE INDEX idx_rel_h_o_s_t_s_d_a_t_a_s_e_t_access_date IF NOT EXISTS
FOR ()-[r:`HOSTS_DATASET`]-()
ON (r.`accessDate`);

CREATE INDEX idx_rel_r_e_p_r_e_s_e_n_t_s_s_t_u_d_y_mapping_method IF NOT EXISTS
FOR ()-[r:`REPRESENTS_STUDY`]-()
ON (r.`mappingMethod`);

CREATE INDEX idx_rel_r_e_p_r_e_s_e_n_t_s_s_t_u_d_y_source_accession IF NOT EXISTS
FOR ()-[r:`REPRESENTS_STUDY`]-()
ON (r.`sourceAccession`);

CREATE INDEX idx_rel_c_o_n_t_r_i_b_u_t_e_s_t_o_source_sample_field IF NOT EXISTS
FOR ()-[r:`CONTRIBUTES_TO`]-()
ON (r.`sourceSampleField`);

CREATE INDEX idx_rel_c_o_n_t_r_i_b_u_t_e_s_t_o_source_sample_value IF NOT EXISTS
FOR ()-[r:`CONTRIBUTES_TO`]-()
ON (r.`sourceSampleValue`);

CREATE INDEX idx_rel_c_o_n_t_r_i_b_u_t_e_s_t_o_contribution_basis IF NOT EXISTS
FOR ()-[r:`CONTRIBUTES_TO`]-()
ON (r.`contributionBasis`);

CREATE INDEX idx_rel_c_o_n_t_r_i_b_u_t_e_s_t_o_aggregation_method IF NOT EXISTS
FOR ()-[r:`CONTRIBUTES_TO`]-()
ON (r.`aggregationMethod`);

CREATE INDEX idx_rel_a_n_n_o_t_a_t_e_d_a_s_c_e_l_l_t_y_p_e_annotation_method IF NOT EXISTS
FOR ()-[r:`ANNOTATED_AS_CELL_TYPE`]-()
ON (r.`annotationMethod`);

CREATE INDEX idx_rel_a_n_n_o_t_a_t_e_d_a_s_c_e_l_l_t_y_p_e_ontology_mapping_status IF NOT EXISTS
FOR ()-[r:`ANNOTATED_AS_CELL_TYPE`]-()
ON (r.`ontologyMappingStatus`);

CREATE INDEX idx_rel_a_n_n_o_t_a_t_e_d_a_s_c_e_l_l_t_y_p_e_source_field IF NOT EXISTS
FOR ()-[r:`ANNOTATED_AS_CELL_TYPE`]-()
ON (r.`sourceField`);

CREATE INDEX idx_rel_h_a_s_c_e_l_l_s_t_a_t_e_source_field IF NOT EXISTS
FOR ()-[r:`HAS_CELL_STATE`]-()
ON (r.`sourceField`);

CREATE INDEX idx_rel_h_a_s_c_e_l_l_s_t_a_t_e_annotation_method IF NOT EXISTS
FOR ()-[r:`HAS_CELL_STATE`]-()
ON (r.`annotationMethod`);

CREATE INDEX idx_rel_m_a_p_s_t_o_p_r_o_t_e_i_n_mapping_source IF NOT EXISTS
FOR ()-[r:`MAPS_TO_PROTEIN`]-()
ON (r.`mappingSource`);

CREATE INDEX idx_rel_m_a_p_s_t_o_p_r_o_t_e_i_n_source_feature_identifier IF NOT EXISTS
FOR ()-[r:`MAPS_TO_PROTEIN`]-()
ON (r.`sourceFeatureIdentifier`);

CREATE INDEX idx_rel_m_a_p_s_t_o_p_r_o_t_e_i_n_annotation_source IF NOT EXISTS
FOR ()-[r:`MAPS_TO_PROTEIN`]-()
ON (r.`annotationSource`);

CREATE INDEX idx_rel_m_a_p_s_t_o_p_r_o_t_e_i_n_annotation_version IF NOT EXISTS
FOR ()-[r:`MAPS_TO_PROTEIN`]-()
ON (r.`annotationVersion`);

CREATE INDEX idx_rel_m_a_p_s_t_o_p_r_o_t_e_i_n_confidence_score IF NOT EXISTS
FOR ()-[r:`MAPS_TO_PROTEIN`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_u_n_d_e_r_w_e_n_t_i_n_t_e_r_v_e_n_t_i_o_n_sequence_order IF NOT EXISTS
FOR ()-[r:`UNDERWENT_INTERVENTION`]-()
ON (r.`sequenceOrder`);

CREATE INDEX idx_rel_u_n_d_e_r_w_e_n_t_i_n_t_e_r_v_e_n_t_i_o_n_intervention_timing IF NOT EXISTS
FOR ()-[r:`UNDERWENT_INTERVENTION`]-()
ON (r.`interventionTiming`);

CREATE INDEX idx_rel_u_n_d_e_r_w_e_n_t_i_n_t_e_r_v_e_n_t_i_o_n_sample_role IF NOT EXISTS
FOR ()-[r:`UNDERWENT_INTERVENTION`]-()
ON (r.`sampleRole`);

CREATE INDEX idx_rel_u_n_d_e_r_w_e_n_t_i_n_t_e_r_v_e_n_t_i_o_n_confidence_score IF NOT EXISTS
FOR ()-[r:`UNDERWENT_INTERVENTION`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_u_s_e_s_a_g_e_n_t_agent_role IF NOT EXISTS
FOR ()-[r:`USES_AGENT`]-()
ON (r.`agentRole`);

CREATE INDEX idx_rel_u_s_e_s_a_g_e_n_t_sequence IF NOT EXISTS
FOR ()-[r:`USES_AGENT`]-()
ON (r.`sequence`);

CREATE INDEX idx_rel_u_s_e_s_a_g_e_n_t_dose_unit IF NOT EXISTS
FOR ()-[r:`USES_AGENT`]-()
ON (r.`doseUnit`);

CREATE INDEX idx_rel_u_s_e_s_a_g_e_n_t_dose_frequency IF NOT EXISTS
FOR ()-[r:`USES_AGENT`]-()
ON (r.`doseFrequency`);

CREATE INDEX idx_rel_u_s_e_s_a_g_e_n_t_route_of_administration IF NOT EXISTS
FOR ()-[r:`USES_AGENT`]-()
ON (r.`routeOfAdministration`);

CREATE INDEX idx_rel_u_s_e_s_p_r_o_c_e_d_u_r_e_procedure_role IF NOT EXISTS
FOR ()-[r:`USES_PROCEDURE`]-()
ON (r.`procedureRole`);

CREATE INDEX idx_rel_u_s_e_s_p_r_o_c_e_d_u_r_e_sequence IF NOT EXISTS
FOR ()-[r:`USES_PROCEDURE`]-()
ON (r.`sequence`);

CREATE INDEX idx_rel_u_s_e_s_p_r_o_c_e_d_u_r_e_anatomical_site IF NOT EXISTS
FOR ()-[r:`USES_PROCEDURE`]-()
ON (r.`anatomicalSite`);

CREATE INDEX idx_rel_u_s_e_s_p_r_o_c_e_d_u_r_e_laterality IF NOT EXISTS
FOR ()-[r:`USES_PROCEDURE`]-()
ON (r.`laterality`);

CREATE INDEX idx_rel_u_s_e_s_p_r_o_c_e_d_u_r_e_confidence_score IF NOT EXISTS
FOR ()-[r:`USES_PROCEDURE`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_r_e_s_u_l_t_e_d_i_n_outcome_role IF NOT EXISTS
FOR ()-[r:`RESULTED_IN`]-()
ON (r.`outcomeRole`);

CREATE INDEX idx_rel_r_e_s_u_l_t_e_d_i_n_assessment_timepoint IF NOT EXISTS
FOR ()-[r:`RESULTED_IN`]-()
ON (r.`assessmentTimepoint`);

CREATE INDEX idx_rel_r_e_s_u_l_t_e_d_i_n_time_unit IF NOT EXISTS
FOR ()-[r:`RESULTED_IN`]-()
ON (r.`timeUnit`);

CREATE INDEX idx_rel_r_e_s_u_l_t_e_d_i_n_causal_interpretation IF NOT EXISTS
FOR ()-[r:`RESULTED_IN`]-()
ON (r.`causalInterpretation`);

CREATE INDEX idx_rel_r_e_s_u_l_t_e_d_i_n_confidence_score IF NOT EXISTS
FOR ()-[r:`RESULTED_IN`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_u_n_d_e_r_w_e_n_t_p_e_r_t_u_r_b_a_t_i_o_n_sequence_order IF NOT EXISTS
FOR ()-[r:`UNDERWENT_PERTURBATION`]-()
ON (r.`sequenceOrder`);

CREATE INDEX idx_rel_u_n_d_e_r_w_e_n_t_p_e_r_t_u_r_b_a_t_i_o_n_perturbation_timing IF NOT EXISTS
FOR ()-[r:`UNDERWENT_PERTURBATION`]-()
ON (r.`perturbationTiming`);

CREATE INDEX idx_rel_u_n_d_e_r_w_e_n_t_p_e_r_t_u_r_b_a_t_i_o_n_experimental_role IF NOT EXISTS
FOR ()-[r:`UNDERWENT_PERTURBATION`]-()
ON (r.`experimentalRole`);

CREATE INDEX idx_rel_u_n_d_e_r_w_e_n_t_p_e_r_t_u_r_b_a_t_i_o_n_replicate_id IF NOT EXISTS
FOR ()-[r:`UNDERWENT_PERTURBATION`]-()
ON (r.`replicateId`);

CREATE INDEX idx_rel_u_n_d_e_r_w_e_n_t_p_e_r_t_u_r_b_a_t_i_o_n_confidence_score IF NOT EXISTS
FOR ()-[r:`UNDERWENT_PERTURBATION`]-()
ON (r.`confidenceScore`);

CREATE INDEX idx_rel_t_a_r_g_e_t_s_target_role IF NOT EXISTS
FOR ()-[r:`TARGETS`]-()
ON (r.`targetRole`);

CREATE INDEX idx_rel_t_a_r_g_e_t_s_target_level IF NOT EXISTS
FOR ()-[r:`TARGETS`]-()
ON (r.`targetLevel`);

CREATE INDEX idx_rel_t_a_r_g_e_t_s_targeting_method IF NOT EXISTS
FOR ()-[r:`TARGETS`]-()
ON (r.`targetingMethod`);

CREATE INDEX idx_rel_t_a_r_g_e_t_s_effect_direction IF NOT EXISTS
FOR ()-[r:`TARGETS`]-()
ON (r.`effectDirection`);

CREATE INDEX idx_rel_t_a_r_g_e_t_s_match_status IF NOT EXISTS
FOR ()-[r:`TARGETS`]-()
ON (r.`matchStatus`);

CREATE INDEX idx_rel_t_a_r_g_e_t_s_confidence_score IF NOT EXISTS
FOR ()-[r:`TARGETS`]-()
ON (r.`confidenceScore`);

// -----------------------------------------------------------------------------
// 5. Full-text indexes for common human-readable searches
// -----------------------------------------------------------------------------

CREATE FULLTEXT INDEX ft_gene_text IF NOT EXISTS
FOR (n:`Gene`)
ON EACH [n.`symbol`, n.`name`, n.`aliases`, n.`description`];

CREATE FULLTEXT INDEX ft_disease_text IF NOT EXISTS
FOR (n:`Disease`)
ON EACH [n.`diseaseName`, n.`diseaseType`];

CREATE FULLTEXT INDEX ft_publication_text IF NOT EXISTS
FOR (n:`Publication`)
ON EACH [n.`title`, n.`abstract`, n.`authors`, n.`journal`];

CREATE FULLTEXT INDEX ft_evidence_text IF NOT EXISTS
FOR (n:`Evidence`)
ON EACH [n.`evidenceText`, n.`claimText`];

CREATE FULLTEXT INDEX ft_chemical_entity_text IF NOT EXISTS
FOR (n:`ChemicalEntity`)
ON EACH [n.`name`, n.`genericName`, n.`brandName`, n.`description`];

CREATE FULLTEXT INDEX ft_protein_text IF NOT EXISTS
FOR (n:`Protein`)
ON EACH [n.`proteinName`, n.`uniprotId`];

CREATE FULLTEXT INDEX ft_metabolite_text IF NOT EXISTS
FOR (n:`Metabolite`)
ON EACH [n.`metaboliteName`, n.`hmdbId`, n.`keggId`, n.`chebiId`];

CREATE FULLTEXT INDEX ft_celltype_text IF NOT EXISTS
FOR (n:`CellType`)
ON EACH [n.`cellTypeName`];

CREATE FULLTEXT INDEX ft_cellstate_text IF NOT EXISTS
FOR (n:`CellState`)
ON EACH [n.`cellStateName`];

CREATE FULLTEXT INDEX ft_sample_text IF NOT EXISTS
FOR (n:`Sample`)
ON EACH [n.`sampleId`, n.`externalSampleId`, n.`sampleClass`, n.`sampleType`];

// -----------------------------------------------------------------------------
// 6. Relationship pattern catalogue from the active schema
// -----------------------------------------------------------------------------
// Neo4j does not pre-declare relationship types in the same way SQL pre-declares tables.
// These patterns are retained here as executable-design reference comments.

// (:Program)-[:HAS_STUDY]->(:Study)
// (:Publication)-[:DESCRIBES_STUDY]->(:Study)
// (:Study)-[:HAS_SUBJECT]->(:Subject)
// (:Subject)-[:PROVIDED_SAMPLE]->(:Sample)
// (:Subject)-[:HAS_ORGANISM]->(:Organism)
// (:Sample)-[:PAIRED_WITH]->(:Sample)
// (:Sample)-[:SAMPLED_FROM_TISSUE]->(:Tissue)
// (:Tissue)-[:PART_OF_ORGAN]->(:Organ)
// (:Sample)-[:COLLECTED_AT_STAGE]->(:DevelopmentalStage)
// (:Sample)-[:HAS_CONDITION]->(:ExperimentalCondition)
// (:Subject)-[:HAS_DIAGNOSIS]->(:Diagnosis)
// (:Diagnosis)-[:OF_DISEASE]->(:Disease)
// (:Diagnosis)-[:HAS_PATHOLOGY]->(:PathologyDetail)
// (:Diagnosis)-[:HAS_PHENOTYPE_OBSERVATION]->(:PhenotypeObservation)
// (:Subject)-[:HAS_SURVIVAL_RECORD]->(:Survival)
// (:Sample)-[:ASSAYED_BY]->(:Assay)
// (:Assay)-[:USED_LIBRARY]->(:LibraryPreparation)
// (:Sample)-[:HAS_METHYLATION_OBSERVATION]->(:MethylationObservation)
// (:MethylationObservation)-[:MEASURES_CPG]->(:CpGSite)
// (:Sample)-[:HAS_EXPRESSION_OBSERVATION]->(:ExpressionObservation)
// (:ExpressionObservation)-[:MEASURES_GENE]->(:Gene)
// (:Sample)-[:HAS_VARIANT_OBSERVATION]->(:VariantObservation)
// (:VariantObservation)-[:OBSERVED_VARIANT]->(:Variant)
// (:Sample)-[:HAS_PROTEIN_OBSERVATION]->(:ProteinObservation)
// (:ProteinObservation)-[:MEASURES_PROTEIN]->(:Protein)
// (:Sample)-[:HAS_METABOLITE_OBSERVATION]->(:MetaboliteObservation)
// (:MetaboliteObservation)-[:MEASURES_METABOLITE]->(:Metabolite)
// (:CpGSite)-[:MAPS_TO_GENE]->(:Gene)
// (:CpGSite)-[:LOCATED_IN_REGION]->(:GenomicRegion)
// (:RegulatoryElement)-[:LOCATED_IN_REGION]->(:GenomicRegion)
// (:RegulatoryElement)-[:REGULATES_GENE]->(:Gene)
// (:Gene)-[:REGULATES_GENE]->(:Gene)
// (:Variant)-[:IS_WITHIN_GENE]->(:Gene)
// (:Variant)-[:LOCATED_IN_REGION]->(:GenomicRegion)
// (:Variant)-[:MODULATES_REGULATION_OF]->(:RegulatoryElement)
// (:Gene)-[:ENCODES]->(:Protein)
// (:Gene)-[:PARTICIPATES_IN_PATHWAY]->(:Pathway)
// (:Sample)-[:HAS_REGULATORY_ELEMENT]->(:RegulatoryElement)
// (:GenomicRegion)-[:ASSOCIATED_WITH_GENE]->(:Gene)
// (:MethylationObservation)-[:CLASSIFIED_USING]->(:MethylationStatusRule)
// (:Publication)-[:PROVIDES_EVIDENCE_FOR]->(:Evidence)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Gene)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Protein)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:CpGSite)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:RegulatoryElement)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Variant)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Disease)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:GenomicRegion)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:MethylationStatusRule)
// (:Repository)-[:HOSTS_DATASET]->(:SingleCellDataset)
// (:SingleCellDataset)-[:REPRESENTS_STUDY]->(:Study)
// (:Sample)-[:CONTRIBUTES_TO]->(:CellSet)
// (:CellSet)-[:ANNOTATED_AS_CELL_TYPE]->(:CellType)
// (:CellSet)-[:HAS_CELL_STATE]->(:CellState)
// (:CellSet)-[:HAS_FEATURE]->(:Feature)
// (:Feature)-[:MAPS_TO_GENE]->(:Gene)
// (:Feature)-[:MAPS_TO_PROTEIN]->(:Protein)
// (:Sample)-[:UNDERWENT_INTERVENTION]->(:Intervention)
// (:Intervention)-[:USES_AGENT]->(:ChemicalEntity)
// (:Intervention)-[:USES_PROCEDURE]->(:Procedure)
// (:Intervention)-[:RESULTED_IN]->(:PhenotypeObservation)
// (:Sample)-[:UNDERWENT_PERTURBATION]->(:Perturbation)
// (:Perturbation)-[:TARGETS]->(:Gene)
// (:Perturbation)-[:TARGETS]->(:Protein)
// (:Perturbation)-[:TARGETS]->(:GenomicRegion)
// (:Perturbation)-[:TARGETS]->(:RegulatoryElement)
// (:Perturbation)-[:HAS_PHENOTYPE_OBSERVATION]->(:PhenotypeObservation)

// -----------------------------------------------------------------------------
// 7. Example query templates from the source schema documentation
// -----------------------------------------------------------------------------
// These are commented out so this setup file can be run safely.

// Example query 1
// MATCH (g:Gene {symbol: $geneSymbol})
// MATCH (mo:MethylationObservation)-[:MEASURES_GENE]->(g)
// MATCH (s:Sample)-[:HAS_METHYLATION_OBSERVATION]->(mo)
// OPTIONAL MATCH (mo)-[:CLASSIFIED_USING]->(rule:MethylationStatusRule)
// RETURN s.sampleId,
//        g.symbol,
//        mo.betaValue,
//        mo.methylationStatus,
//        rule.methylationStatusRuleId,
//        mo.sourceDataset,
//        mo.sourceFile
// LIMIT 50;

// Example query 2
// MATCH (mo:MethylationObservation {methylationObservationId: $observationId})
// MATCH (mo)-[:CLASSIFIED_USING]->(rule:MethylationStatusRule)
// OPTIONAL MATCH (pub:Publication)-[:PROVIDES_EVIDENCE_FOR]->(:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(rule)
// RETURN mo.methylationObservationId,
//        mo.betaValue,
//        mo.methylationStatus,
//        rule.methylationStatusRuleId,
//        rule.ruleName,
//        pub.publicationId,
//        pub.title,
//        pub.doi,
//        pub.pmid
// LIMIT 20;

// Example query 3
// MATCH (g:Gene {symbol: $geneSymbol})
// MATCH (v:Variant)-[r:IS_WITHIN_GENE]->(g)
// MATCH (vo:VariantObservation)-[:OBSERVED_VARIANT]->(v)
// MATCH (s:Sample)-[:HAS_VARIANT_OBSERVATION]->(vo)
// RETURN s.sampleId,
//        v.variantId,
//        vo.variantObservationId,
//        vo.variantCaller,
//        vo.somaticStatus,
//        vo.variantAlleleFrequency,
//        r.geneRegion,
//        r.transcriptId,
//        r.annotationSource,
//        r.annotationVersion,
//        vo.sourceDataset,
//        vo.sourceFile
// LIMIT 50;

// Example query 4
// MATCH (source:Sample)-[r:PAIRED_WITH]->(paired:Sample)
// WHERE r.pairingType IN ["tumor_normal_match", "barcode_match"]
// RETURN source.sampleId AS sourceSample,
//        paired.sampleId AS pairedSample,
//        source.sampleClass AS sourceClass,
//        paired.sampleClass AS pairedClass,
//        r.pairingType,
//        r.referenceRole
// LIMIT 50;

// Example query 5
// MATCH (s:Sample)-[r:CONTRIBUTES_TO]->(cs:CellSet)
// MATCH (cs)-[:ANNOTATED_AS_CELL_TYPE]->(ct:CellType)
// OPTIONAL MATCH (cs)-[:HAS_CELL_STATE]->(state:CellState)
// WHERE toLower(ct.cellTypeName) CONTAINS toLower($cellTypeName)
// RETURN s.sampleId,
//        cs.cellSetId,
//        cs.cellSetType,
//        cs.cellCount AS totalCellSetCount,
//        r.contributedCellCount,
//        r.fractionOfSampleCells,
//        r.fractionOfCellSet,
//        ct.cellTypeName,
//        state.cellStateName
// LIMIT 50;

// Example query 6
// MATCH (st:Study)-[:HAS_SUBJECT]->(sub:Subject)
// MATCH (sub)-[:PROVIDED_SAMPLE]->(s:Sample)
// MATCH (s)-[:ASSAYED_BY]->(a:Assay)
// WHERE a.isSingleCellAssay = true
// OPTIONAL MATCH (a)-[:USED_LIBRARY]->(lib:LibraryPreparation)
// OPTIONAL MATCH (repo:Repository)-[:HOSTS_DATASET]->(scd:SingleCellDataset)
// OPTIONAL MATCH (scd)-[:REPRESENTS_STUDY]->(st)
// RETURN st.studyId,
//        sub.subjectId,
//        s.sampleId,
//        a.assayId,
//        a.assayType,
//        a.libraryStrategy,
//        lib.libraryPreparationId,
//        lib.libraryProtocol,
//        repo.repositoryName,
//        scd.singleCellDatasetId
// LIMIT 50;

// Example query 7
// MATCH (sub:Subject)-[:PROVIDED_SAMPLE]->(s:Sample)
// MATCH (s)-[:UNDERWENT_INTERVENTION]->(i:Intervention:Drug)
// OPTIONAL MATCH (i)-[r:USES_AGENT]->(agent:ChemicalEntity)
// RETURN sub.subjectId,
//        s.sampleId,
//        i.interventionId,
//        i.interventionName,
//        i.regimenName,
//        agent.name AS agentName,
//        r.agentRole,
//        r.sequence,
//        r.doseValue,
//        r.doseUnit,
//        r.routeOfAdministration
// LIMIT 50;

// Example query 8
// MATCH (p:Protein {uniprotId: $uniprotId})
// MATCH (e:Evidence)-[r:SUPPORTS_ASSOCIATION_WITH]->(p)
// MATCH (pub:Publication)-[:PROVIDES_EVIDENCE_FOR]->(e)
// RETURN p.proteinId,
//        p.proteinName,
//        e.evidenceId,
//        e.claimText,
//        e.evidenceType,
//        r.entityRole,
//        r.supportDirection,
//        pub.publicationId,
//        pub.title
// LIMIT 50;

// Example query 9
// MATCH (s:Sample)-[:UNDERWENT_PERTURBATION]->(pert:Perturbation)
// MATCH (pert)-[r:TARGETS]->(p:Protein)
// RETURN s.sampleId,
//        pert.perturbationId,
//        pert.perturbationType,
//        p.proteinId,
//        p.proteinName,
//        r.targetRole,
//        r.targetLevel,
//        r.effectDirection,
//        r.confidenceScore
// LIMIT 50;

// Example query 10
// MATCH (s:Sample)-[:UNDERWENT_PERTURBATION]->(pert:Perturbation)
// OPTIONAL MATCH (pert)-[r:HAS_PHENOTYPE_OBSERVATION]->(pheno:PhenotypeObservation)
// RETURN s.sampleId,
//        pert.perturbationId,
//        pert.perturbationName,
//        pert.perturbationType,
//        pheno.phenotypeObservationId,
//        pheno.phenotypeName,
//        pheno.phenotypeType,
//        pheno.category,
//        pheno.status,
//        pheno.value,
//        pheno.unit,
//        pheno.observationDay,
//        r.daysToEvent,
//        pheno.sourceDataset,
//        pheno.sourceFile
// LIMIT 50;

// Example query 11
// MATCH (sub:Subject)-[:HAS_DIAGNOSIS]->(diag:Diagnosis)-[:OF_DISEASE]->(d:Disease)
// OPTIONAL MATCH (diag)-[:HAS_PATHOLOGY]->(path:PathologyDetail)
// OPTIONAL MATCH (diag)-[phenoRel:HAS_PHENOTYPE_OBSERVATION]->(pheno:PhenotypeObservation)
// RETURN sub.subjectId,
//        diag.diagnosisId,
//        diag.diagnosisRole,
//        diag.diseaseSubtype,
//        diag.pathologicStage,
//        diag.tumorGrade,
//        d.diseaseId,
//        d.diseaseName,
//        path.pathologyDetailId,
//        path.morphologyDescription,
//        pheno.phenotypeObservationId,
//        pheno.phenotypeName,
//        pheno.status,
//        pheno.value,
//        phenoRel.daysToEvent
// LIMIT 50;

// Example query 12
// MATCH (sub:Subject)-[:HAS_SURVIVAL_RECORD]->(surv:Survival)
// RETURN sub.subjectId,
//        surv.survivalId,
//        surv.survivalType,
//        surv.timeOrigin,
//        surv.timeToEventDays,
//        surv.eventType,
//        surv.eventOccurred,
//        surv.lastFollowUpDays,
//        surv.censoringReason
// LIMIT 50;

// -----------------------------------------------------------------------------
// 8. Additional source Cypher snippets and modelling examples
// -----------------------------------------------------------------------------
// Retained as comments for reference. Some snippets are pattern illustrations, not standalone queries.

// Source Cypher snippet 1
// (:Sample)-[:PAIRED_WITH {
//   pairingType: "tumor_normal_match",
//   referenceRole: "normal_reference"
// }]->(:Sample)

// Source Cypher snippet 2
// (:Intervention:Drug)-[:USES_AGENT {
//   agentRole: "primary_agent",
//   sequence: 1
// }]->(:ChemicalEntity)

// Source Cypher snippet 3
// (:Subject)-[:HAS_DIAGNOSIS {
//   temporalOrder: 1,
//   isPrimaryDiagnosis: true,
//   confidenceScore: 1.0
// }]->(:Diagnosis {
//   diagnosisId: "diag_TCGA-BH-A0B3_001",
//   diagnosisMethod: "Histopathology",
//   tumorSubtype: "Luminal A",
//   sourceDataset: "TCGA-BRCA"
// })
// (:Diagnosis)-[:OF_DISEASE]->(:Disease)

// Source Cypher snippet 4
// (:Sample)-[:MEASURES_GENE {
//   expressionValue: 42.7
// }]->(:Gene)

// Source Cypher snippet 5
// (:Sample)-[:HAS_EXPRESSION_OBSERVATION]->(:ExpressionObservation)
// (:ExpressionObservation)-[:MEASURES_GENE]->(:Gene)

// Source Cypher snippet 6
// (:CpGSite {cpgId: "cg00000029"})
// -[:MAPS_TO_GENE {
//   mappingMethod: "array_manifest_annotation",
//   geneContext: "TSS200",
//   distanceToTSS: 250,
//   annotationSource: "Illumina",
//   annotationVersion: "EPIC_v1.0",
//   confidenceScore: 1.0
// }]->
// (:Gene {geneId: "ENSG00000141510"})
//
//
// (:Variant {variantId: "var_17_7674220_C_T"})
// -[:IS_WITHIN_GENE {
//   geneRegion: "exon",
//   transcriptId: "ENST00000269305",
//   exonNumber: 5,
//   annotationSource: "Ensembl VEP",
//   annotationVersion: "VEP_110"
// }]->
// (:Gene {geneId: "ENSG00000141510"})

// Source Cypher snippet 7
// (:Study)-[:HAS_SUBJECT]->(:Subject)
// (:Subject)-[:PROVIDED_SAMPLE]->(:Sample)
// (:Sample)-[:ASSAYED_BY]->(:Assay)

// Source Cypher snippet 8
// (:Intervention:Drug)
// (:Intervention:Radiation)
// (:Intervention:Surgery)

// Source Cypher snippet 9
// (:Intervention:Drug)

// Source Cypher snippet 10
// (:Intervention)-[:HAS_USED]->(:Drug)

// Source Cypher snippet 11
// MERGE (i:Intervention:Drug {interventionId: "interv_drug_001"})
// SET i.interventionType = "Drug therapy",
//     i.interventionSubtype = "Chemotherapy";

// Source Cypher snippet 12
// (:Publication)-[:DESCRIBES_STUDY]->(:Study)
// (:Program)-[:HAS_STUDY]->(:Study)
// (:Study)-[:HAS_SUBJECT]->(:Subject)
// (:Subject)-[:PROVIDED_SAMPLE]->(:Sample)
// (:Subject)-[:HAS_ORGANISM]->(:Organism)
// (:Sample)-[:SAMPLED_FROM_TISSUE]->(:Tissue)
// (:Tissue)-[:PART_OF_ORGAN]->(:Organ)
// (:Sample)-[:COLLECTED_AT_STAGE]->(:DevelopmentalStage)
// (:Sample)-[:HAS_CONDITION]->(:ExperimentalCondition)
// (:Sample)-[:ASSAYED_BY]->(:Assay)
// (:Assay)-[:USED_LIBRARY]->(:LibraryPreparation)

// Source Cypher snippet 13
// (:Subject)-[:HAS_DIAGNOSIS]->(:Diagnosis)
// (:Diagnosis)-[:OF_DISEASE]->(:Disease)
// (:Diagnosis)-[:HAS_PATHOLOGY]->(:PathologyDetail)
// (:Diagnosis)-[:HAS_PHENOTYPE_OBSERVATION]->(:PhenotypeObservation)
// (:Subject)-[:HAS_SURVIVAL_RECORD]->(:Survival)

// Source Cypher snippet 14
// (:Sample)-[:HAS_EXPRESSION_OBSERVATION]->(:ExpressionObservation)
// (:ExpressionObservation)-[:MEASURES_GENE]->(:Gene)
//
// (:Sample)-[:HAS_METHYLATION_OBSERVATION]->(:MethylationObservation)
// (:MethylationObservation)-[:MEASURES_CPG]->(:CpGSite)
//
// (:Sample)-[:HAS_VARIANT_OBSERVATION]->(:VariantObservation)
// (:VariantObservation)-[:OBSERVED_VARIANT]->(:Variant)
//
// (:Sample)-[:HAS_PROTEIN_OBSERVATION]->(:ProteinObservation)
// (:ProteinObservation)-[:MEASURES_PROTEIN]->(:Protein)
//
// (:Sample)-[:HAS_METABOLITE_OBSERVATION]->(:MetaboliteObservation)
// (:MetaboliteObservation)-[:MEASURES_METABOLITE]->(:Metabolite)

// Source Cypher snippet 15
// (:Publication)-[:DESCRIBES_STUDY]->(:Study)
// (:Program)-[:HAS_STUDY]->(:Study)
// (:Study)-[:HAS_SUBJECT]->(:Subject)
// (:Subject)-[:PROVIDED_SAMPLE]->(:Sample)
// (:Sample)-[:ASSAYED_BY]->(:Assay)
// (:Assay)-[:USED_LIBRARY]->(:LibraryPreparation)

// Source Cypher snippet 16
// (:Sample)-[:CONTRIBUTES_TO]->(:CellSet)
// (:CellSet)-[:ANNOTATED_AS_CELL_TYPE]->(:CellType)
// (:CellSet)-[:HAS_CELL_STATE]->(:CellState)
//
// (:CellSet)-[:HAS_FEATURE]->(:Feature)
// (:Feature)-[:MAPS_TO_GENE]->(:Gene)
// (:Feature)-[:MAPS_TO_PROTEIN]->(:Protein)

// Source Cypher snippet 17
// (:Sample)-[:UNDERWENT_INTERVENTION]->(:Intervention)
//
// (:Sample)-[:UNDERWENT_INTERVENTION]->(:Intervention:Drug)
// (:Sample)-[:UNDERWENT_INTERVENTION]->(:Intervention:Radiation)
// (:Sample)-[:UNDERWENT_INTERVENTION]->(:Intervention:Immunotherapy)
// (:Sample)-[:UNDERWENT_INTERVENTION]->(:Intervention:Surgery)
// (:Sample)-[:UNDERWENT_INTERVENTION]->(:Intervention:Therapy)
// (:Sample)-[:UNDERWENT_INTERVENTION]->(:Intervention:Exposure)
//
// (:Intervention)-[:USES_AGENT]->(:ChemicalEntity)
// (:Intervention)-[:USES_PROCEDURE]->(:Procedure)
// (:Intervention)-[:RESULTED_IN]->(:PhenotypeObservation)

// Source Cypher snippet 18
// (:Sample)-[:UNDERWENT_PERTURBATION]->(:Perturbation)
// (:Perturbation)-[:TARGETS]->(:Gene)
// (:Perturbation)-[:TARGETS]->(:Protein)
// (:Perturbation)-[:TARGETS]->(:GenomicRegion)
// (:Perturbation)-[:TARGETS]->(:RegulatoryElement)
// (:Perturbation)-[:HAS_PHENOTYPE_OBSERVATION]->(:PhenotypeObservation)

// Source Cypher snippet 19
// (:Sample)-[:HAS_REGULATORY_ELEMENT]->(:RegulatoryElement)
// (:RegulatoryElement)-[:REGULATES_GENE]->(:Gene)
// (:Variant)-[:MODULATES_REGULATION_OF]->(:RegulatoryElement)
// (:Perturbation)-[:TARGETS]->(:RegulatoryElement)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:RegulatoryElement)

// Source Cypher snippet 20
// (:Gene)-[:ENCODES]->(:Protein)
// (:Gene)-[:PARTICIPATES_IN_PATHWAY]->(:Pathway)

// Source Cypher snippet 21
// (:Publication)-[:PROVIDES_EVIDENCE_FOR]->(:Evidence)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Gene)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Protein)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:CpGSite)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:RegulatoryElement)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Variant)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Disease)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:GenomicRegion)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:MethylationStatusRule)

// Source Cypher snippet 22
// (:Repository)-[:HOSTS_DATASET]->(:SingleCellDataset)
// (:SingleCellDataset)-[:REPRESENTS_STUDY]->(:Study)

// Source Cypher snippet 23
// (:MethylationObservation)-[:CLASSIFIED_USING]->(:MethylationStatusRule)

// Source Cypher snippet 24
// (:Publication)-[:PROVIDES_EVIDENCE_FOR]->(:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:MethylationStatusRule)<-[:CLASSIFIED_USING]-(:MethylationObservation)

// Source Cypher snippet 25
// (:Publication)-[:DESCRIBES_STUDY]->(:Study)
// (:Program)-[:HAS_STUDY]->(:Study)
// (:Study)-[:HAS_SUBJECT]->(:Subject)
// (:Subject)-[:PROVIDED_SAMPLE]->(:Sample)
// (:Sample)-[:ASSAYED_BY]->(:Assay)
// (:Assay)-[:USED_LIBRARY]->(:LibraryPreparation)

// Source Cypher snippet 26
// (:Repository)-[:HOSTS_DATASET]->(:SingleCellDataset)
// (:SingleCellDataset)-[:REPRESENTS_STUDY]->(:Study)

// Source Cypher snippet 27
// (:Sample)-[:CONTRIBUTES_TO]->(:CellSet)
// (:CellSet)-[:ANNOTATED_AS_CELL_TYPE]->(:CellType)
// (:CellSet)-[:HAS_CELL_STATE]->(:CellState)

// Source Cypher snippet 28
// (:CellSet)-[:ANNOTATED_AS_CELL_TYPE]->(:CellType)
// (:CellSet)-[:HAS_CELL_STATE]->(:CellState)

// Source Cypher snippet 29
// (:CellSet)-[:ANNOTATED_AS_CELL_TYPE {
//   sourceField: "author_annotation_v2",
//   sourceValue: "macro_phage_cluster_1",
//   ontologyMappingStatus: "mapped_to_Cell_Ontology",
//   annotationMethod: "source_provided_author_annotation"
// }]->(:CellType {cellTypeName: "Macrophage"})

// Source Cypher snippet 30
// (:Sample)-[:CONTRIBUTES_TO {
//   contributedCellCount: 120,
//   fractionOfSampleCells: 0.18,
//   fractionOfCellSet: 0.07,
//   sourceSampleField: "sample_id",
//   sourceSampleValue: "donor_12_sample_A",
//   contributionBasis: "obs_sample_membership",
//   aggregationMethod: "groupby_sample_and_cell_type"
// }]->(:CellSet {cellSetId: "set_lung_atlas_leiden_4_cd8t"})

// Source Cypher snippet 31
// (:Sample {sampleId: "tumour_sample"})
// -[:PAIRED_WITH {
//   pairingType: "tumor_normal_match",
//   referenceRole: "normal_reference"
// }]->
// (:Sample {sampleId: "normal_sample"})

// Source Cypher snippet 32
// (:Intervention:Drug)
// (:Intervention:Radiation)
// (:Intervention:Drug:Immunotherapy)

// Source Cypher snippet 33
// MERGE (s:Sample {sampleId: "TCGA-BH-A0B3-01A"})
// MERGE (i:Intervention:Drug {interventionId: "interv_drug_001"})
// SET i.interventionType = "drug",
//     i.interventionSubtype = "chemotherapy",
//     i.regimenName = "FOLFOX",
//     i.routeOfAdministration = "intravenous",
//     i.sourceDataset = "TCGA-BRCA"
// MERGE (agent:ChemicalEntity {chemicalEntityId: "drugbank:DB00515"})
// SET agent.name = "Cisplatin",
//     agent.genericName = "cisplatin",
//     agent.drugBankId = "DB00515"
// MERGE (s)-[:UNDERWENT_INTERVENTION]->(i)
// MERGE (i)-[:USES_AGENT {
//   agentRole: "primary_agent",
//   sequence: 1,
//   doseValue: 50.0,
//   doseUnit: "mg/m2",
//   routeOfAdministration: "intravenous"
// }]->(agent);

// Source Cypher snippet 34
// MERGE (s:Sample {sampleId: "TCGA-BH-A0B3-01A"})
// MERGE (i:Intervention:Radiation {interventionId: "interv_rad_001"})
// SET i.interventionType = "radiation",
//     i.radiationType = "external_beam",
//     i.targetSite = "left_breast",
//     i.totalDoseCGy = 5000.0,
//     i.fractionDoseCGy = 200.0,
//     i.numberOfFractions = 25,
//     i.radiationTechnique = "IMRT",
//     i.sourceDataset = "TCGA-BRCA"
// MERGE (s)-[:UNDERWENT_INTERVENTION]->(i);

// Source Cypher snippet 35
// MERGE (s:Sample {sampleId: "sample_example_001"})
// MERGE (i:Intervention:Drug:Immunotherapy {interventionId: "interv_immunodrug_001"})
// SET i.interventionType = "drug",
//     i.interventionSubtype = "checkpoint_inhibitor",
//     i.immunotherapyType = "checkpoint_inhibitor",
//     i.checkpointTarget = "PD-1",
//     i.biomarkerRequirement = "PD-L1_positive",
//     i.sourceDataset = "example_dataset"
// MERGE (agent:ChemicalEntity {chemicalEntityId: "drugbank:DB09037"})
// SET agent.name = "Pembrolizumab",
//     agent.genericName = "pembrolizumab",
//     agent.drugBankId = "DB09037"
// MERGE (s)-[:UNDERWENT_INTERVENTION]->(i)
// MERGE (i)-[:USES_AGENT {
//   agentRole: "primary_agent",
//   sequence: 1,
//   routeOfAdministration: "intravenous"
// }]->(agent);

// Source Cypher snippet 36
// CREATE CONSTRAINT sample_id_unique IF NOT EXISTS
// FOR (s:Sample)
// REQUIRE s.sampleId IS UNIQUE;
//
// CREATE CONSTRAINT protein_observation_id_unique IF NOT EXISTS
// FOR (po:ProteinObservation)
// REQUIRE po.proteinObservationId IS UNIQUE;
//
// CREATE CONSTRAINT metabolite_observation_id_unique IF NOT EXISTS
// FOR (mo:MetaboliteObservation)
// REQUIRE mo.metaboliteObservationId IS UNIQUE;
