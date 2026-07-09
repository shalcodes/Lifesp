// ============================================================================
// LifeSphere Neo4j Schema
// Generated from neo4j_updated_schema_new.md
// Purpose: constraints and indexes for Neo4j KG ingestion and agentic retrieval
// Architecture: Raw Data → Standardisation → PostgreSQL → Neo4j KG → Agentic AI
// ============================================================================
//
// Scope notes:
//   - Schema setup only. No nodes, relationships, or example data are created.
//   - Idempotent Neo4j 5 syntax (IF NOT EXISTS). Safe to run repeatedly.
//   - Node/relationship creation is owned by kg_ingestion_scripts/ +
//     kg_ingestion_orchestrator.py, reading from the PostgreSQL staging DB.
//   - Relationship existence is NOT enforced (not portable across editions).
//   - Intervention subtype labels (:Drug, :Radiation, :Immunotherapy, :Surgery,
//     :Therapy, :Exposure) are additional labels on the same :Intervention node
//     and have no independent primary key, so they get no uniqueness constraint.
//   - Single-cell assays remain regular :Assay nodes, discriminated by
//     assayType / platform / libraryStrategy / omicsInfo / isSingleCellAssay.


// ---------------------------------------------------------------------------
// 1. Node uniqueness constraints
// ---------------------------------------------------------------------------

// --- Literature, program, and evidence layer ---

CREATE CONSTRAINT publication_publicationId_unique IF NOT EXISTS
FOR (n:Publication)
REQUIRE n.publicationId IS UNIQUE;

CREATE CONSTRAINT program_programId_unique IF NOT EXISTS
FOR (n:Program)
REQUIRE n.programId IS UNIQUE;

CREATE CONSTRAINT evidence_evidenceId_unique IF NOT EXISTS
FOR (n:Evidence)
REQUIRE n.evidenceId IS UNIQUE;

// --- Study, subject, sample, assay backbone ---

CREATE CONSTRAINT study_studyId_unique IF NOT EXISTS
FOR (n:Study)
REQUIRE n.studyId IS UNIQUE;

CREATE CONSTRAINT subject_subjectId_unique IF NOT EXISTS
FOR (n:Subject)
REQUIRE n.subjectId IS UNIQUE;

CREATE CONSTRAINT sample_sampleId_unique IF NOT EXISTS
FOR (n:Sample)
REQUIRE n.sampleId IS UNIQUE;

CREATE CONSTRAINT assay_assayId_unique IF NOT EXISTS
FOR (n:Assay)
REQUIRE n.assayId IS UNIQUE;

CREATE CONSTRAINT librarypreparation_libraryPreparationId_unique IF NOT EXISTS
FOR (n:LibraryPreparation)
REQUIRE n.libraryPreparationId IS UNIQUE;

// --- Biological and anatomical context ---

CREATE CONSTRAINT organism_taxonId_unique IF NOT EXISTS
FOR (n:Organism)
REQUIRE n.taxonId IS UNIQUE;

CREATE CONSTRAINT tissue_tissueId_unique IF NOT EXISTS
FOR (n:Tissue)
REQUIRE n.tissueId IS UNIQUE;

CREATE CONSTRAINT organ_organId_unique IF NOT EXISTS
FOR (n:Organ)
REQUIRE n.organId IS UNIQUE;

CREATE CONSTRAINT developmentalstage_stageId_unique IF NOT EXISTS
FOR (n:DevelopmentalStage)
REQUIRE n.stageId IS UNIQUE;

CREATE CONSTRAINT experimentalcondition_conditionId_unique IF NOT EXISTS
FOR (n:ExperimentalCondition)
REQUIRE n.conditionId IS UNIQUE;

// --- Clinical layer ---

CREATE CONSTRAINT disease_diseaseId_unique IF NOT EXISTS
FOR (n:Disease)
REQUIRE n.diseaseId IS UNIQUE;

CREATE CONSTRAINT diagnosis_diagnosisId_unique IF NOT EXISTS
FOR (n:Diagnosis)
REQUIRE n.diagnosisId IS UNIQUE;

CREATE CONSTRAINT pathologydetail_pathologyDetailId_unique IF NOT EXISTS
FOR (n:PathologyDetail)
REQUIRE n.pathologyDetailId IS UNIQUE;

CREATE CONSTRAINT survival_survivalId_unique IF NOT EXISTS
FOR (n:Survival)
REQUIRE n.survivalId IS UNIQUE;

// --- Genomic and regulatory reference entities ---

CREATE CONSTRAINT gene_geneId_unique IF NOT EXISTS
FOR (n:Gene)
REQUIRE n.geneId IS UNIQUE;

CREATE CONSTRAINT variant_variantId_unique IF NOT EXISTS
FOR (n:Variant)
REQUIRE n.variantId IS UNIQUE;

CREATE CONSTRAINT cpgsite_cpgId_unique IF NOT EXISTS
FOR (n:CpGSite)
REQUIRE n.cpgId IS UNIQUE;

CREATE CONSTRAINT genomicregion_regionId_unique IF NOT EXISTS
FOR (n:GenomicRegion)
REQUIRE n.regionId IS UNIQUE;

CREATE CONSTRAINT regulatoryelement_elementId_unique IF NOT EXISTS
FOR (n:RegulatoryElement)
REQUIRE n.elementId IS UNIQUE;

// --- Observation nodes ---

CREATE CONSTRAINT phenotypeobservation_phenotypeObservationId_unique IF NOT EXISTS
FOR (n:PhenotypeObservation)
REQUIRE n.phenotypeObservationId IS UNIQUE;

CREATE CONSTRAINT variantobservation_variantObservationId_unique IF NOT EXISTS
FOR (n:VariantObservation)
REQUIRE n.variantObservationId IS UNIQUE;

CREATE CONSTRAINT expressionobservation_expressionObservationId_unique IF NOT EXISTS
FOR (n:ExpressionObservation)
REQUIRE n.expressionObservationId IS UNIQUE;

CREATE CONSTRAINT methylationobservation_methylationObservationId_unique IF NOT EXISTS
FOR (n:MethylationObservation)
REQUIRE n.methylationObservationId IS UNIQUE;

CREATE CONSTRAINT methylationstatusrule_methylationStatusRuleId_unique IF NOT EXISTS
FOR (n:MethylationStatusRule)
REQUIRE n.methylationStatusRuleId IS UNIQUE;

CREATE CONSTRAINT proteinobservation_proteinObservationId_unique IF NOT EXISTS
FOR (n:ProteinObservation)
REQUIRE n.proteinObservationId IS UNIQUE;

CREATE CONSTRAINT metaboliteobservation_metaboliteObservationId_unique IF NOT EXISTS
FOR (n:MetaboliteObservation)
REQUIRE n.metaboliteObservationId IS UNIQUE;

// --- Protein, metabolite, and pathway reference entities ---

CREATE CONSTRAINT protein_proteinId_unique IF NOT EXISTS
FOR (n:Protein)
REQUIRE n.proteinId IS UNIQUE;

CREATE CONSTRAINT metabolite_metaboliteId_unique IF NOT EXISTS
FOR (n:Metabolite)
REQUIRE n.metaboliteId IS UNIQUE;

CREATE CONSTRAINT pathway_pathwayId_unique IF NOT EXISTS
FOR (n:Pathway)
REQUIRE n.pathwayId IS UNIQUE;

// --- Single-cell layer ---

CREATE CONSTRAINT repository_repositoryId_unique IF NOT EXISTS
FOR (n:Repository)
REQUIRE n.repositoryId IS UNIQUE;

CREATE CONSTRAINT singlecelldataset_singleCellDatasetId_unique IF NOT EXISTS
FOR (n:SingleCellDataset)
REQUIRE n.singleCellDatasetId IS UNIQUE;

CREATE CONSTRAINT cellset_cellSetId_unique IF NOT EXISTS
FOR (n:CellSet)
REQUIRE n.cellSetId IS UNIQUE;

CREATE CONSTRAINT celltype_cellTypeId_unique IF NOT EXISTS
FOR (n:CellType)
REQUIRE n.cellTypeId IS UNIQUE;

CREATE CONSTRAINT cellstate_cellStateId_unique IF NOT EXISTS
FOR (n:CellState)
REQUIRE n.cellStateId IS UNIQUE;

CREATE CONSTRAINT feature_featureId_unique IF NOT EXISTS
FOR (n:Feature)
REQUIRE n.featureId IS UNIQUE;

// --- Intervention, agent, procedure, and perturbation layer ---

CREATE CONSTRAINT intervention_interventionId_unique IF NOT EXISTS
FOR (n:Intervention)
REQUIRE n.interventionId IS UNIQUE;

CREATE CONSTRAINT chemicalentity_chemicalEntityId_unique IF NOT EXISTS
FOR (n:ChemicalEntity)
REQUIRE n.chemicalEntityId IS UNIQUE;

CREATE CONSTRAINT procedure_procedureId_unique IF NOT EXISTS
FOR (n:Procedure)
REQUIRE n.procedureId IS UNIQUE;

CREATE CONSTRAINT perturbation_perturbationId_unique IF NOT EXISTS
FOR (n:Perturbation)
REQUIRE n.perturbationId IS UNIQUE;


// ---------------------------------------------------------------------------
// 2. Core node lookup indexes
// ---------------------------------------------------------------------------

// --- Study ---

CREATE INDEX study_studyAbbreviation_index IF NOT EXISTS
FOR (n:Study)
ON (n.studyAbbreviation);

CREATE INDEX study_studyName_index IF NOT EXISTS
FOR (n:Study)
ON (n.studyName);

CREATE INDEX study_diseaseType_index IF NOT EXISTS
FOR (n:Study)
ON (n.diseaseType);

CREATE INDEX study_primarySite_index IF NOT EXISTS
FOR (n:Study)
ON (n.primarySite);

CREATE INDEX study_sourceDataset_index IF NOT EXISTS
FOR (n:Study)
ON (n.sourceDataset);

// --- Subject ---

CREATE INDEX subject_subjectType_index IF NOT EXISTS
FOR (n:Subject)
ON (n.subjectType);

CREATE INDEX subject_donorId_index IF NOT EXISTS
FOR (n:Subject)
ON (n.donorId);

CREATE INDEX subject_submitterId_index IF NOT EXISTS
FOR (n:Subject)
ON (n.submitterId);

CREATE INDEX subject_species_index IF NOT EXISTS
FOR (n:Subject)
ON (n.species);

// --- Sample ---

CREATE INDEX sample_subjectId_index IF NOT EXISTS
FOR (n:Sample)
ON (n.subjectId);

CREATE INDEX sample_externalSampleId_index IF NOT EXISTS
FOR (n:Sample)
ON (n.externalSampleId);

CREATE INDEX sample_sampleClass_index IF NOT EXISTS
FOR (n:Sample)
ON (n.sampleClass);

CREATE INDEX sample_sampleType_index IF NOT EXISTS
FOR (n:Sample)
ON (n.sampleType);

CREATE INDEX sample_sampleMaterial_index IF NOT EXISTS
FOR (n:Sample)
ON (n.sampleMaterial);

CREATE INDEX sample_suspensionType_index IF NOT EXISTS
FOR (n:Sample)
ON (n.suspensionType);

CREATE INDEX sample_sourceDataset_index IF NOT EXISTS
FOR (n:Sample)
ON (n.sourceDataset);

// --- Assay (single-cell assays are regular Assay nodes) ---

CREATE INDEX assay_assayType_index IF NOT EXISTS
FOR (n:Assay)
ON (n.assayType);

CREATE INDEX assay_platform_index IF NOT EXISTS
FOR (n:Assay)
ON (n.platform);

CREATE INDEX assay_libraryStrategy_index IF NOT EXISTS
FOR (n:Assay)
ON (n.libraryStrategy);

CREATE INDEX assay_omicsInfo_index IF NOT EXISTS
FOR (n:Assay)
ON (n.omicsInfo);

CREATE INDEX assay_isSingleCellAssay_index IF NOT EXISTS
FOR (n:Assay)
ON (n.isSingleCellAssay);

CREATE INDEX assay_sourceDataset_index IF NOT EXISTS
FOR (n:Assay)
ON (n.sourceDataset);

// --- LibraryPreparation ---

CREATE INDEX librarypreparation_libraryStrategy_index IF NOT EXISTS
FOR (n:LibraryPreparation)
ON (n.libraryStrategy);

CREATE INDEX librarypreparation_libraryProtocol_index IF NOT EXISTS
FOR (n:LibraryPreparation)
ON (n.libraryProtocol);

CREATE INDEX librarypreparation_libraryKit_index IF NOT EXISTS
FOR (n:LibraryPreparation)
ON (n.libraryKit);

CREATE INDEX librarypreparation_inputMaterial_index IF NOT EXISTS
FOR (n:LibraryPreparation)
ON (n.inputMaterial);

CREATE INDEX librarypreparation_barcodeStrategy_index IF NOT EXISTS
FOR (n:LibraryPreparation)
ON (n.barcodeStrategy);

CREATE INDEX librarypreparation_sourceDataset_index IF NOT EXISTS
FOR (n:LibraryPreparation)
ON (n.sourceDataset);

// --- ExperimentalCondition ---
// Note: Section 7.1 does not define ExperimentalCondition.sourceDataset,
// so no index is created for it.

CREATE INDEX experimentalcondition_conditionName_index IF NOT EXISTS
FOR (n:ExperimentalCondition)
ON (n.conditionName);

CREATE INDEX experimentalcondition_conditionType_index IF NOT EXISTS
FOR (n:ExperimentalCondition)
ON (n.conditionType);

CREATE INDEX experimentalcondition_conditionLabel_index IF NOT EXISTS
FOR (n:ExperimentalCondition)
ON (n.conditionLabel);

// --- Clinical layer ---

CREATE INDEX diagnosis_subjectId_index IF NOT EXISTS
FOR (n:Diagnosis)
ON (n.subjectId);

CREATE INDEX diagnosis_diseaseId_index IF NOT EXISTS
FOR (n:Diagnosis)
ON (n.diseaseId);

CREATE INDEX diagnosis_diagnosisRole_index IF NOT EXISTS
FOR (n:Diagnosis)
ON (n.diagnosisRole);

CREATE INDEX diagnosis_diseaseSubtype_index IF NOT EXISTS
FOR (n:Diagnosis)
ON (n.diseaseSubtype);

CREATE INDEX diagnosis_tumorSubtype_index IF NOT EXISTS
FOR (n:Diagnosis)
ON (n.tumorSubtype);

CREATE INDEX diagnosis_sourceDataset_index IF NOT EXISTS
FOR (n:Diagnosis)
ON (n.sourceDataset);

CREATE INDEX pathologydetail_diagnosisId_index IF NOT EXISTS
FOR (n:PathologyDetail)
ON (n.diagnosisId);

CREATE INDEX pathologydetail_sampleId_index IF NOT EXISTS
FOR (n:PathologyDetail)
ON (n.sampleId);

CREATE INDEX survival_subjectId_index IF NOT EXISTS
FOR (n:Survival)
ON (n.subjectId);

CREATE INDEX survival_survivalType_index IF NOT EXISTS
FOR (n:Survival)
ON (n.survivalType);

CREATE INDEX survival_eventType_index IF NOT EXISTS
FOR (n:Survival)
ON (n.eventType);

CREATE INDEX survival_eventOccurred_index IF NOT EXISTS
FOR (n:Survival)
ON (n.eventOccurred);

// --- Stable biological reference nodes ---

CREATE INDEX gene_symbol_index IF NOT EXISTS
FOR (n:Gene)
ON (n.symbol);

CREATE INDEX gene_ensemblGeneId_index IF NOT EXISTS
FOR (n:Gene)
ON (n.ensemblGeneId);

CREATE INDEX gene_hgncId_index IF NOT EXISTS
FOR (n:Gene)
ON (n.hgncId);

CREATE INDEX gene_chromosome_index IF NOT EXISTS
FOR (n:Gene)
ON (n.chromosome);

CREATE INDEX variant_variantClass_index IF NOT EXISTS
FOR (n:Variant)
ON (n.variantClass);

CREATE INDEX variant_chromosome_index IF NOT EXISTS
FOR (n:Variant)
ON (n.chromosome);

CREATE INDEX variant_geneId_index IF NOT EXISTS
FOR (n:Variant)
ON (n.geneId);

CREATE INDEX variant_regionId_index IF NOT EXISTS
FOR (n:Variant)
ON (n.regionId);

CREATE INDEX cpgsite_chromosome_index IF NOT EXISTS
FOR (n:CpGSite)
ON (n.chromosome);

CREATE INDEX cpgsite_geneSymbol_index IF NOT EXISTS
FOR (n:CpGSite)
ON (n.geneSymbol);

CREATE INDEX cpgsite_ensemblGeneId_index IF NOT EXISTS
FOR (n:CpGSite)
ON (n.ensemblGeneId);

CREATE INDEX genomicregion_chromosome_index IF NOT EXISTS
FOR (n:GenomicRegion)
ON (n.chromosome);

CREATE INDEX regulatoryelement_elementType_index IF NOT EXISTS
FOR (n:RegulatoryElement)
ON (n.elementType);

CREATE INDEX regulatoryelement_chromosome_index IF NOT EXISTS
FOR (n:RegulatoryElement)
ON (n.chromosome);

CREATE INDEX protein_uniprotId_index IF NOT EXISTS
FOR (n:Protein)
ON (n.uniprotId);

CREATE INDEX protein_geneId_index IF NOT EXISTS
FOR (n:Protein)
ON (n.geneId);

CREATE INDEX metabolite_hmdbId_index IF NOT EXISTS
FOR (n:Metabolite)
ON (n.hmdbId);

CREATE INDEX metabolite_keggId_index IF NOT EXISTS
FOR (n:Metabolite)
ON (n.keggId);

CREATE INDEX metabolite_chebiId_index IF NOT EXISTS
FOR (n:Metabolite)
ON (n.chebiId);

CREATE INDEX pathway_pathwayName_index IF NOT EXISTS
FOR (n:Pathway)
ON (n.pathwayName);

CREATE INDEX pathway_sourceVocabulary_index IF NOT EXISTS
FOR (n:Pathway)
ON (n.sourceVocabulary);


// ---------------------------------------------------------------------------
// 3. Observation mirror-property indexes
// ---------------------------------------------------------------------------
// Mirror IDs support fast joins; canonical traversal still uses relationships.

// --- ExpressionObservation ---

CREATE INDEX expressionobservation_sampleId_index IF NOT EXISTS
FOR (n:ExpressionObservation)
ON (n.sampleId);

CREATE INDEX expressionobservation_assayId_index IF NOT EXISTS
FOR (n:ExpressionObservation)
ON (n.assayId);

CREATE INDEX expressionobservation_geneId_index IF NOT EXISTS
FOR (n:ExpressionObservation)
ON (n.geneId);

CREATE INDEX expressionobservation_observationType_index IF NOT EXISTS
FOR (n:ExpressionObservation)
ON (n.observationType);

CREATE INDEX expressionobservation_sourceDataset_index IF NOT EXISTS
FOR (n:ExpressionObservation)
ON (n.sourceDataset);

// --- MethylationObservation ---

CREATE INDEX methylationobservation_sampleId_index IF NOT EXISTS
FOR (n:MethylationObservation)
ON (n.sampleId);

CREATE INDEX methylationobservation_assayId_index IF NOT EXISTS
FOR (n:MethylationObservation)
ON (n.assayId);

CREATE INDEX methylationobservation_cpgId_index IF NOT EXISTS
FOR (n:MethylationObservation)
ON (n.cpgId);

CREATE INDEX methylationobservation_observationType_index IF NOT EXISTS
FOR (n:MethylationObservation)
ON (n.observationType);

CREATE INDEX methylationobservation_methylationStatus_index IF NOT EXISTS
FOR (n:MethylationObservation)
ON (n.methylationStatus);

CREATE INDEX methylationobservation_sourceDataset_index IF NOT EXISTS
FOR (n:MethylationObservation)
ON (n.sourceDataset);

// --- VariantObservation ---

CREATE INDEX variantobservation_sampleId_index IF NOT EXISTS
FOR (n:VariantObservation)
ON (n.sampleId);

CREATE INDEX variantobservation_assayId_index IF NOT EXISTS
FOR (n:VariantObservation)
ON (n.assayId);

CREATE INDEX variantobservation_variantId_index IF NOT EXISTS
FOR (n:VariantObservation)
ON (n.variantId);

CREATE INDEX variantobservation_somaticStatus_index IF NOT EXISTS
FOR (n:VariantObservation)
ON (n.somaticStatus);

CREATE INDEX variantobservation_callStatus_index IF NOT EXISTS
FOR (n:VariantObservation)
ON (n.callStatus);

CREATE INDEX variantobservation_sourceDataset_index IF NOT EXISTS
FOR (n:VariantObservation)
ON (n.sourceDataset);

// --- ProteinObservation ---

CREATE INDEX proteinobservation_sampleId_index IF NOT EXISTS
FOR (n:ProteinObservation)
ON (n.sampleId);

CREATE INDEX proteinobservation_assayId_index IF NOT EXISTS
FOR (n:ProteinObservation)
ON (n.assayId);

CREATE INDEX proteinobservation_proteinId_index IF NOT EXISTS
FOR (n:ProteinObservation)
ON (n.proteinId);

CREATE INDEX proteinobservation_observationType_index IF NOT EXISTS
FOR (n:ProteinObservation)
ON (n.observationType);

CREATE INDEX proteinobservation_sourceDataset_index IF NOT EXISTS
FOR (n:ProteinObservation)
ON (n.sourceDataset);

// --- MetaboliteObservation ---

CREATE INDEX metaboliteobservation_sampleId_index IF NOT EXISTS
FOR (n:MetaboliteObservation)
ON (n.sampleId);

CREATE INDEX metaboliteobservation_assayId_index IF NOT EXISTS
FOR (n:MetaboliteObservation)
ON (n.assayId);

CREATE INDEX metaboliteobservation_metaboliteId_index IF NOT EXISTS
FOR (n:MetaboliteObservation)
ON (n.metaboliteId);

CREATE INDEX metaboliteobservation_observationType_index IF NOT EXISTS
FOR (n:MetaboliteObservation)
ON (n.observationType);

CREATE INDEX metaboliteobservation_sourceDataset_index IF NOT EXISTS
FOR (n:MetaboliteObservation)
ON (n.sourceDataset);

// --- PhenotypeObservation ---

CREATE INDEX phenotypeobservation_subjectId_index IF NOT EXISTS
FOR (n:PhenotypeObservation)
ON (n.subjectId);

CREATE INDEX phenotypeobservation_sampleId_index IF NOT EXISTS
FOR (n:PhenotypeObservation)
ON (n.sampleId);

CREATE INDEX phenotypeobservation_diagnosisId_index IF NOT EXISTS
FOR (n:PhenotypeObservation)
ON (n.diagnosisId);

CREATE INDEX phenotypeobservation_perturbationId_index IF NOT EXISTS
FOR (n:PhenotypeObservation)
ON (n.perturbationId);

CREATE INDEX phenotypeobservation_hpoId_index IF NOT EXISTS
FOR (n:PhenotypeObservation)
ON (n.hpoId);

CREATE INDEX phenotypeobservation_category_index IF NOT EXISTS
FOR (n:PhenotypeObservation)
ON (n.category);

CREATE INDEX phenotypeobservation_phenotypeType_index IF NOT EXISTS
FOR (n:PhenotypeObservation)
ON (n.phenotypeType);

CREATE INDEX phenotypeobservation_status_index IF NOT EXISTS
FOR (n:PhenotypeObservation)
ON (n.status);

CREATE INDEX phenotypeobservation_sourceDataset_index IF NOT EXISTS
FOR (n:PhenotypeObservation)
ON (n.sourceDataset);


// ---------------------------------------------------------------------------
// 4. Provenance and ontology indexes
// ---------------------------------------------------------------------------
// Only created where the property exists in the Section 7 property catalogue.

// --- sourceFile ---

CREATE INDEX sample_sourceFile_index IF NOT EXISTS
FOR (n:Sample)
ON (n.sourceFile);

CREATE INDEX assay_sourceFile_index IF NOT EXISTS
FOR (n:Assay)
ON (n.sourceFile);

CREATE INDEX librarypreparation_sourceFile_index IF NOT EXISTS
FOR (n:LibraryPreparation)
ON (n.sourceFile);

CREATE INDEX evidence_sourceFile_index IF NOT EXISTS
FOR (n:Evidence)
ON (n.sourceFile);

CREATE INDEX expressionobservation_sourceFile_index IF NOT EXISTS
FOR (n:ExpressionObservation)
ON (n.sourceFile);

CREATE INDEX methylationobservation_sourceFile_index IF NOT EXISTS
FOR (n:MethylationObservation)
ON (n.sourceFile);

CREATE INDEX variantobservation_sourceFile_index IF NOT EXISTS
FOR (n:VariantObservation)
ON (n.sourceFile);

CREATE INDEX proteinobservation_sourceFile_index IF NOT EXISTS
FOR (n:ProteinObservation)
ON (n.sourceFile);

CREATE INDEX metaboliteobservation_sourceFile_index IF NOT EXISTS
FOR (n:MetaboliteObservation)
ON (n.sourceFile);

CREATE INDEX phenotypeobservation_sourceFile_index IF NOT EXISTS
FOR (n:PhenotypeObservation)
ON (n.sourceFile);

CREATE INDEX intervention_sourceFile_index IF NOT EXISTS
FOR (n:Intervention)
ON (n.sourceFile);

CREATE INDEX perturbation_sourceFile_index IF NOT EXISTS
FOR (n:Perturbation)
ON (n.sourceFile);

// --- sourceDatabase ---

CREATE INDEX publication_sourceDatabase_index IF NOT EXISTS
FOR (n:Publication)
ON (n.sourceDatabase);

CREATE INDEX program_sourceDatabase_index IF NOT EXISTS
FOR (n:Program)
ON (n.sourceDatabase);

CREATE INDEX evidence_sourceDatabase_index IF NOT EXISTS
FOR (n:Evidence)
ON (n.sourceDatabase);

CREATE INDEX regulatoryelement_sourceDatabase_index IF NOT EXISTS
FOR (n:RegulatoryElement)
ON (n.sourceDatabase);

CREATE INDEX protein_sourceDatabase_index IF NOT EXISTS
FOR (n:Protein)
ON (n.sourceDatabase);

CREATE INDEX chemicalentity_sourceDatabase_index IF NOT EXISTS
FOR (n:ChemicalEntity)
ON (n.sourceDatabase);

CREATE INDEX procedure_sourceDatabase_index IF NOT EXISTS
FOR (n:Procedure)
ON (n.sourceDatabase);

// --- sourceVocabulary and ontologyId ---

CREATE INDEX tissue_sourceVocabulary_index IF NOT EXISTS
FOR (n:Tissue)
ON (n.sourceVocabulary);

CREATE INDEX developmentalstage_sourceVocabulary_index IF NOT EXISTS
FOR (n:DevelopmentalStage)
ON (n.sourceVocabulary);

CREATE INDEX disease_sourceVocabulary_index IF NOT EXISTS
FOR (n:Disease)
ON (n.sourceVocabulary);

CREATE INDEX procedure_sourceVocabulary_index IF NOT EXISTS
FOR (n:Procedure)
ON (n.sourceVocabulary);

CREATE INDEX disease_ontologyId_index IF NOT EXISTS
FOR (n:Disease)
ON (n.ontologyId);

CREATE INDEX pathway_ontologyId_index IF NOT EXISTS
FOR (n:Pathway)
ON (n.ontologyId);

CREATE INDEX disease_sourceDataset_index IF NOT EXISTS
FOR (n:Disease)
ON (n.sourceDataset);

// --- configKey ---

CREATE INDEX expressionobservation_configKey_index IF NOT EXISTS
FOR (n:ExpressionObservation)
ON (n.configKey);

CREATE INDEX methylationobservation_configKey_index IF NOT EXISTS
FOR (n:MethylationObservation)
ON (n.configKey);

CREATE INDEX proteinobservation_configKey_index IF NOT EXISTS
FOR (n:ProteinObservation)
ON (n.configKey);

CREATE INDEX metaboliteobservation_configKey_index IF NOT EXISTS
FOR (n:MetaboliteObservation)
ON (n.configKey);

CREATE INDEX perturbation_configKey_index IF NOT EXISTS
FOR (n:Perturbation)
ON (n.configKey);

// --- pipelineVersion ---

CREATE INDEX expressionobservation_pipelineVersion_index IF NOT EXISTS
FOR (n:ExpressionObservation)
ON (n.pipelineVersion);

CREATE INDEX methylationobservation_pipelineVersion_index IF NOT EXISTS
FOR (n:MethylationObservation)
ON (n.pipelineVersion);

CREATE INDEX variantobservation_pipelineVersion_index IF NOT EXISTS
FOR (n:VariantObservation)
ON (n.pipelineVersion);


// ---------------------------------------------------------------------------
// 5. Single-cell, intervention, perturbation, and evidence indexes
// ---------------------------------------------------------------------------

// --- Single-cell layer ---

CREATE INDEX repository_repositoryName_index IF NOT EXISTS
FOR (n:Repository)
ON (n.repositoryName);

CREATE INDEX singlecelldataset_repositoryDatasetId_index IF NOT EXISTS
FOR (n:SingleCellDataset)
ON (n.repositoryDatasetId);

CREATE INDEX singlecelldataset_modality_index IF NOT EXISTS
FOR (n:SingleCellDataset)
ON (n.modality);

CREATE INDEX singlecelldataset_sourceDataset_index IF NOT EXISTS
FOR (n:SingleCellDataset)
ON (n.sourceDataset);

CREATE INDEX cellset_cellSetType_index IF NOT EXISTS
FOR (n:CellSet)
ON (n.cellSetType);

CREATE INDEX cellset_sourceClusterId_index IF NOT EXISTS
FOR (n:CellSet)
ON (n.sourceClusterId);

CREATE INDEX cellset_sourceAnnotationField_index IF NOT EXISTS
FOR (n:CellSet)
ON (n.sourceAnnotationField);

CREATE INDEX cellset_sourceAnnotationValue_index IF NOT EXISTS
FOR (n:CellSet)
ON (n.sourceAnnotationValue);

CREATE INDEX cellset_sourceCellTypeLabel_index IF NOT EXISTS
FOR (n:CellSet)
ON (n.sourceCellTypeLabel);

CREATE INDEX celltype_cellTypeName_index IF NOT EXISTS
FOR (n:CellType)
ON (n.cellTypeName);

CREATE INDEX cellstate_cellStateName_index IF NOT EXISTS
FOR (n:CellState)
ON (n.cellStateName);

CREATE INDEX feature_featureName_index IF NOT EXISTS
FOR (n:Feature)
ON (n.featureName);

CREATE INDEX feature_featureType_index IF NOT EXISTS
FOR (n:Feature)
ON (n.featureType);

// --- Intervention (base label; subtype labels carry no separate key) ---

CREATE INDEX intervention_sampleId_index IF NOT EXISTS
FOR (n:Intervention)
ON (n.sampleId);

CREATE INDEX intervention_interventionType_index IF NOT EXISTS
FOR (n:Intervention)
ON (n.interventionType);

CREATE INDEX intervention_interventionSubtype_index IF NOT EXISTS
FOR (n:Intervention)
ON (n.interventionSubtype);

CREATE INDEX intervention_interventionName_index IF NOT EXISTS
FOR (n:Intervention)
ON (n.interventionName);

CREATE INDEX intervention_status_index IF NOT EXISTS
FOR (n:Intervention)
ON (n.status);

CREATE INDEX intervention_sourceDataset_index IF NOT EXISTS
FOR (n:Intervention)
ON (n.sourceDataset);

// --- ChemicalEntity ---

CREATE INDEX chemicalentity_name_index IF NOT EXISTS
FOR (n:ChemicalEntity)
ON (n.name);

CREATE INDEX chemicalentity_genericName_index IF NOT EXISTS
FOR (n:ChemicalEntity)
ON (n.genericName);

CREATE INDEX chemicalentity_drugBankId_index IF NOT EXISTS
FOR (n:ChemicalEntity)
ON (n.drugBankId);

CREATE INDEX chemicalentity_chemblId_index IF NOT EXISTS
FOR (n:ChemicalEntity)
ON (n.chemblId);

CREATE INDEX chemicalentity_pubChemCid_index IF NOT EXISTS
FOR (n:ChemicalEntity)
ON (n.pubChemCid);

CREATE INDEX chemicalentity_rxNormCode_index IF NOT EXISTS
FOR (n:ChemicalEntity)
ON (n.rxNormCode);

CREATE INDEX chemicalentity_agentCategory_index IF NOT EXISTS
FOR (n:ChemicalEntity)
ON (n.agentCategory);

// --- Procedure ---

CREATE INDEX procedure_procedureName_index IF NOT EXISTS
FOR (n:Procedure)
ON (n.procedureName);

CREATE INDEX procedure_procedureCode_index IF NOT EXISTS
FOR (n:Procedure)
ON (n.procedureCode);

CREATE INDEX procedure_procedureCodeSystem_index IF NOT EXISTS
FOR (n:Procedure)
ON (n.procedureCodeSystem);

CREATE INDEX procedure_procedureType_index IF NOT EXISTS
FOR (n:Procedure)
ON (n.procedureType);

// --- Perturbation ---

CREATE INDEX perturbation_sampleId_index IF NOT EXISTS
FOR (n:Perturbation)
ON (n.sampleId);

CREATE INDEX perturbation_perturbationType_index IF NOT EXISTS
FOR (n:Perturbation)
ON (n.perturbationType);

CREATE INDEX perturbation_perturbationMethod_index IF NOT EXISTS
FOR (n:Perturbation)
ON (n.perturbationMethod);

CREATE INDEX perturbation_confirmationStatus_index IF NOT EXISTS
FOR (n:Perturbation)
ON (n.confirmationStatus);

CREATE INDEX perturbation_sourceDataset_index IF NOT EXISTS
FOR (n:Perturbation)
ON (n.sourceDataset);

// --- Evidence and publication retrieval ---

CREATE INDEX evidence_publicationId_index IF NOT EXISTS
FOR (n:Evidence)
ON (n.publicationId);

CREATE INDEX evidence_evidenceType_index IF NOT EXISTS
FOR (n:Evidence)
ON (n.evidenceType);

CREATE INDEX evidence_associationType_index IF NOT EXISTS
FOR (n:Evidence)
ON (n.associationType);

CREATE INDEX publication_doi_index IF NOT EXISTS
FOR (n:Publication)
ON (n.doi);

CREATE INDEX publication_pmid_index IF NOT EXISTS
FOR (n:Publication)
ON (n.pmid);


// ---------------------------------------------------------------------------
// 6. Optional relationship-property indexes
// ---------------------------------------------------------------------------
// Relationship property indexes are valid Neo4j 5 syntax, but support and value
// depend on the target deployment and query mix. They are left COMMENTED OUT.
// Enable selectively only after profiling agentic retrieval queries.
//
// CREATE INDEX paired_with_pairingType_index IF NOT EXISTS
// FOR ()-[r:PAIRED_WITH]-()
// ON (r.pairingType);
//
// CREATE INDEX paired_with_referenceRole_index IF NOT EXISTS
// FOR ()-[r:PAIRED_WITH]-()
// ON (r.referenceRole);
//
// CREATE INDEX has_condition_conditionRole_index IF NOT EXISTS
// FOR ()-[r:HAS_CONDITION]-()
// ON (r.conditionRole);
//
// CREATE INDEX has_diagnosis_temporalOrder_index IF NOT EXISTS
// FOR ()-[r:HAS_DIAGNOSIS]-()
// ON (r.temporalOrder);
//
// CREATE INDEX has_diagnosis_isPrimaryDiagnosis_index IF NOT EXISTS
// FOR ()-[r:HAS_DIAGNOSIS]-()
// ON (r.isPrimaryDiagnosis);
//
// CREATE INDEX has_phenotype_observation_daysToEvent_index IF NOT EXISTS
// FOR ()-[r:HAS_PHENOTYPE_OBSERVATION]-()
// ON (r.daysToEvent);
//
// CREATE INDEX used_library_protocolSource_index IF NOT EXISTS
// FOR ()-[r:USED_LIBRARY]-()
// ON (r.protocolSource);
//
// CREATE INDEX contributes_to_sourceSampleValue_index IF NOT EXISTS
// FOR ()-[r:CONTRIBUTES_TO]-()
// ON (r.sourceSampleValue);
//
// CREATE INDEX contributes_to_contributionBasis_index IF NOT EXISTS
// FOR ()-[r:CONTRIBUTES_TO]-()
// ON (r.contributionBasis);
//
// CREATE INDEX annotated_as_cell_type_sourceField_index IF NOT EXISTS
// FOR ()-[r:ANNOTATED_AS_CELL_TYPE]-()
// ON (r.sourceField);
//
// CREATE INDEX annotated_as_cell_type_ontologyMappingStatus_index IF NOT EXISTS
// FOR ()-[r:ANNOTATED_AS_CELL_TYPE]-()
// ON (r.ontologyMappingStatus);
//
// CREATE INDEX has_cell_state_sourceField_index IF NOT EXISTS
// FOR ()-[r:HAS_CELL_STATE]-()
// ON (r.sourceField);
//
// CREATE INDEX uses_agent_agentRole_index IF NOT EXISTS
// FOR ()-[r:USES_AGENT]-()
// ON (r.agentRole);
//
// CREATE INDEX uses_agent_sequence_index IF NOT EXISTS
// FOR ()-[r:USES_AGENT]-()
// ON (r.sequence);
//
// CREATE INDEX underwent_intervention_sampleRole_index IF NOT EXISTS
// FOR ()-[r:UNDERWENT_INTERVENTION]-()
// ON (r.sampleRole);
//
// CREATE INDEX underwent_perturbation_experimentalRole_index IF NOT EXISTS
// FOR ()-[r:UNDERWENT_PERTURBATION]-()
// ON (r.experimentalRole);
//
// CREATE INDEX targets_targetLevel_index IF NOT EXISTS
// FOR ()-[r:TARGETS]-()
// ON (r.targetLevel);
//
// CREATE INDEX targets_effectDirection_index IF NOT EXISTS
// FOR ()-[r:TARGETS]-()
// ON (r.effectDirection);
//
// CREATE INDEX targets_matchStatus_index IF NOT EXISTS
// FOR ()-[r:TARGETS]-()
// ON (r.matchStatus);
//
// CREATE INDEX supports_association_with_entityRole_index IF NOT EXISTS
// FOR ()-[r:SUPPORTS_ASSOCIATION_WITH]-()
// ON (r.entityRole);
//
// CREATE INDEX supports_association_with_supportDirection_index IF NOT EXISTS
// FOR ()-[r:SUPPORTS_ASSOCIATION_WITH]-()
// ON (r.supportDirection);


// ---------------------------------------------------------------------------
// 7. Active relationship patterns documented as comments
// ---------------------------------------------------------------------------
// Source of truth: Section 5 (Core Relationship Definitions).
// Relationship existence is not enforced. These patterns are created by the
// Neo4j KG ingestion scripts, and are documented here for schema-aware
// agentic Cypher planning.

// --- 5.1 Study and sample flow ---
// (:Publication)-[:DESCRIBES_STUDY]->(:Study)
// (:Program)-[:HAS_STUDY]->(:Study)
// (:Study)-[:HAS_SUBJECT]->(:Subject)
// (:Subject)-[:PROVIDED_SAMPLE]->(:Sample)
// (:Subject)-[:HAS_ORGANISM]->(:Organism)
// (:Sample)-[:PAIRED_WITH]->(:Sample)
// (:Sample)-[:SAMPLED_FROM_TISSUE]->(:Tissue)
// (:Tissue)-[:PART_OF_ORGAN]->(:Organ)
// (:Sample)-[:COLLECTED_AT_STAGE]->(:DevelopmentalStage)

// --- 5.2 Experimental and clinical context ---
// (:Sample)-[:HAS_CONDITION]->(:ExperimentalCondition)
// (:Subject)-[:HAS_DIAGNOSIS]->(:Diagnosis)
// (:Diagnosis)-[:OF_DISEASE]->(:Disease)
// (:Diagnosis)-[:HAS_PATHOLOGY]->(:PathologyDetail)
// (:Diagnosis)-[:HAS_PHENOTYPE_OBSERVATION]->(:PhenotypeObservation)
// (:Subject)-[:HAS_SURVIVAL_RECORD]->(:Survival)

// --- 5.3 Assay-related relationships ---
// (:Sample)-[:ASSAYED_BY]->(:Assay)
// (:Assay)-[:USED_LIBRARY]->(:LibraryPreparation)

// --- 5.4 Molecular observation relationships ---
// (:Sample)-[:HAS_EXPRESSION_OBSERVATION]->(:ExpressionObservation)
// (:ExpressionObservation)-[:MEASURES_GENE]->(:Gene)
// (:Sample)-[:HAS_METHYLATION_OBSERVATION]->(:MethylationObservation)
// (:MethylationObservation)-[:MEASURES_CPG]->(:CpGSite)
// (:Sample)-[:HAS_VARIANT_OBSERVATION]->(:VariantObservation)
// (:VariantObservation)-[:OBSERVED_VARIANT]->(:Variant)
// (:Sample)-[:HAS_PROTEIN_OBSERVATION]->(:ProteinObservation)
// (:ProteinObservation)-[:MEASURES_PROTEIN]->(:Protein)
// (:Sample)-[:HAS_METABOLITE_OBSERVATION]->(:MetaboliteObservation)
// (:MetaboliteObservation)-[:MEASURES_METABOLITE]->(:Metabolite)

// TODO: Example queries (Section 9.3) and the Section 8.4 attribute row for
// MEASURES_GENE.functionalDomain mention
// (:MethylationObservation)-[:MEASURES_GENE]->(:Gene), but Section 5.4 does not
// list it as an active relationship. Confirm whether this should be added to the
// active schema. Until confirmed, traverse
// (:MethylationObservation)-[:MEASURES_CPG]->(:CpGSite)-[:MAPS_TO_GENE]->(:Gene).

// --- 5.5 Genomic and regulatory reference relationships ---
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

// --- 5.6 Methylation rule and classification relationships ---
// (:MethylationObservation)-[:CLASSIFIED_USING]->(:MethylationStatusRule)

// --- 5.7 Text, evidence, and retrieval relationships ---
// (:Publication)-[:PROVIDES_EVIDENCE_FOR]->(:Evidence)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Gene)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Protein)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:CpGSite)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:RegulatoryElement)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Variant)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:Disease)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:GenomicRegion)
// (:Evidence)-[:SUPPORTS_ASSOCIATION_WITH]->(:MethylationStatusRule)

// --- 5.8 Single-cell dataset relationships ---
// (:Repository)-[:HOSTS_DATASET]->(:SingleCellDataset)
// (:SingleCellDataset)-[:REPRESENTS_STUDY]->(:Study)
// (:Sample)-[:CONTRIBUTES_TO]->(:CellSet)
// (:CellSet)-[:ANNOTATED_AS_CELL_TYPE]->(:CellType)
// (:CellSet)-[:HAS_CELL_STATE]->(:CellState)
// (:CellSet)-[:HAS_FEATURE]->(:Feature)
// (:Feature)-[:MAPS_TO_GENE]->(:Gene)
// (:Feature)-[:MAPS_TO_PROTEIN]->(:Protein)

// --- 5.9 Intervention relationships ---
// Multi-labelled intervention nodes are the same :Intervention node with an
// additional label: :Intervention:Drug, :Intervention:Radiation,
// :Intervention:Immunotherapy, :Intervention:Surgery, :Intervention:Therapy,
// :Intervention:Exposure
// (:Sample)-[:UNDERWENT_INTERVENTION]->(:Intervention)
// (:Intervention)-[:USES_AGENT]->(:ChemicalEntity)
// (:Intervention)-[:USES_PROCEDURE]->(:Procedure)
// (:Intervention)-[:RESULTED_IN]->(:PhenotypeObservation)

// --- 5.10 Perturbation relationships ---
// (:Sample)-[:UNDERWENT_PERTURBATION]->(:Perturbation)
// (:Perturbation)-[:TARGETS]->(:Gene)
// (:Perturbation)-[:TARGETS]->(:Protein)
// (:Perturbation)-[:TARGETS]->(:GenomicRegion)
// (:Perturbation)-[:TARGETS]->(:RegulatoryElement)
// (:Perturbation)-[:HAS_PHENOTYPE_OBSERVATION]->(:PhenotypeObservation)

// ============================================================================
// End of LifeSphere Neo4j schema setup
// ============================================================================
