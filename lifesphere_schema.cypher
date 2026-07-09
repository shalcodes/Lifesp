// =============================================================================
// LifeSphere Knowledge Graph — Schema Migration
// =============================================================================
// File:        V1__lifesphere_schema.cypher
// Source:      neo4j_updated_schema_new.md (schema authority: KG_Entity_and_Attribute.xlsx)
// Target:      Neo4j 5.x (Community-safe; Enterprise-only blocks are commented)
// Idempotent:  Yes — every statement uses IF NOT EXISTS and may be re-run safely.
//
// USAGE
//   cypher-shell -u neo4j -p <password> -d <database> -f V1__lifesphere_schema.cypher
//   # or, in Neo4j Browser / Aura Query, paste and run (statements are ;-delimited)
//
// CONTENTS
//   1. Uniqueness constraints (primary keys)           — one per node label
//   2. Property-existence constraints (Enterprise)     — commented, opt-in
//   3. Range indexes (lookup / filter fields)
//   4. Relationship property indexes                   — commented, opt-in
//   5. Full-text indexes (entity resolution)
//   6. Verification
//   7. Rollback                                        — commented
//
// CONVENTIONS (§2.1)
//   Node labels        PascalCase          e.g. MethylationObservation
//   Relationship types UPPER_SNAKE_CASE    e.g. HAS_METHYLATION_OBSERVATION
//   Properties         camelCase           e.g. sourceDataset
//   Primary keys       end in `Id`         e.g. sampleId
//   Constraint names   <entity>_id_unique
//   Index names        <entity>_<field>_index
//
// NOTES
//   - A uniqueness constraint is backed by its own range index. Do NOT add a
//     separate index on a constrained property; §3 below omits them deliberately.
//   - Multi-labelled nodes (§2.4) such as (:Intervention:Drug) are constrained on
//     the BASE label only. `interventionId` is unique across all subtype labels.
//   - No constraints are defined for individual `Cell` nodes: standalone `Cell`
//     nodes are not part of the active schema (§9.1). Traverse via `CellSet`.
//   - `Feature` is optional (§4). Its constraint is harmless if unused.
// =============================================================================


// =============================================================================
// 1. UNIQUENESS CONSTRAINTS — PRIMARY KEYS
// =============================================================================

// -----------------------------------------------------------------------------
// 1.1 Program, Study, and Publication layer
// -----------------------------------------------------------------------------
CREATE CONSTRAINT program_id_unique IF NOT EXISTS
FOR (n:Program) REQUIRE n.programId IS UNIQUE;

CREATE CONSTRAINT study_id_unique IF NOT EXISTS
FOR (n:Study) REQUIRE n.studyId IS UNIQUE;

CREATE CONSTRAINT publication_id_unique IF NOT EXISTS
FOR (n:Publication) REQUIRE n.publicationId IS UNIQUE;

// -----------------------------------------------------------------------------
// 1.2 Subject, Sample, and Assay backbone
// -----------------------------------------------------------------------------
CREATE CONSTRAINT subject_id_unique IF NOT EXISTS
FOR (n:Subject) REQUIRE n.subjectId IS UNIQUE;

CREATE CONSTRAINT sample_id_unique IF NOT EXISTS
FOR (n:Sample) REQUIRE n.sampleId IS UNIQUE;

CREATE CONSTRAINT assay_id_unique IF NOT EXISTS
FOR (n:Assay) REQUIRE n.assayId IS UNIQUE;

CREATE CONSTRAINT library_preparation_id_unique IF NOT EXISTS
FOR (n:LibraryPreparation) REQUIRE n.libraryPreparationId IS UNIQUE;

// -----------------------------------------------------------------------------
// 1.3 Biological context entities
// -----------------------------------------------------------------------------
CREATE CONSTRAINT organism_taxon_id_unique IF NOT EXISTS
FOR (n:Organism) REQUIRE n.taxonId IS UNIQUE;

CREATE CONSTRAINT tissue_id_unique IF NOT EXISTS
FOR (n:Tissue) REQUIRE n.tissueId IS UNIQUE;

CREATE CONSTRAINT organ_id_unique IF NOT EXISTS
FOR (n:Organ) REQUIRE n.organId IS UNIQUE;

CREATE CONSTRAINT developmental_stage_id_unique IF NOT EXISTS
FOR (n:DevelopmentalStage) REQUIRE n.stageId IS UNIQUE;

CREATE CONSTRAINT experimental_condition_id_unique IF NOT EXISTS
FOR (n:ExperimentalCondition) REQUIRE n.conditionId IS UNIQUE;

// -----------------------------------------------------------------------------
// 1.4 Clinical layer — Diagnosis / PathologyDetail / Survival
// -----------------------------------------------------------------------------
CREATE CONSTRAINT disease_id_unique IF NOT EXISTS
FOR (n:Disease) REQUIRE n.diseaseId IS UNIQUE;

CREATE CONSTRAINT diagnosis_id_unique IF NOT EXISTS
FOR (n:Diagnosis) REQUIRE n.diagnosisId IS UNIQUE;

CREATE CONSTRAINT pathology_detail_id_unique IF NOT EXISTS
FOR (n:PathologyDetail) REQUIRE n.pathologyDetailId IS UNIQUE;

CREATE CONSTRAINT survival_id_unique IF NOT EXISTS
FOR (n:Survival) REQUIRE n.survivalId IS UNIQUE;

// -----------------------------------------------------------------------------
// 1.5 Genomic and regulatory reference entities
// -----------------------------------------------------------------------------
CREATE CONSTRAINT gene_id_unique IF NOT EXISTS
FOR (n:Gene) REQUIRE n.geneId IS UNIQUE;

CREATE CONSTRAINT variant_id_unique IF NOT EXISTS
FOR (n:Variant) REQUIRE n.variantId IS UNIQUE;

CREATE CONSTRAINT cpg_site_id_unique IF NOT EXISTS
FOR (n:CpGSite) REQUIRE n.cpgId IS UNIQUE;

CREATE CONSTRAINT genomic_region_id_unique IF NOT EXISTS
FOR (n:GenomicRegion) REQUIRE n.regionId IS UNIQUE;

// NOTE: RegulatoryElement's primary key is `elementId`, not `regulatoryElementId`.
CREATE CONSTRAINT regulatory_element_id_unique IF NOT EXISTS
FOR (n:RegulatoryElement) REQUIRE n.elementId IS UNIQUE;

// -----------------------------------------------------------------------------
// 1.6 Protein, metabolite, and pathway reference entities
// -----------------------------------------------------------------------------
CREATE CONSTRAINT protein_id_unique IF NOT EXISTS
FOR (n:Protein) REQUIRE n.proteinId IS UNIQUE;

CREATE CONSTRAINT metabolite_id_unique IF NOT EXISTS
FOR (n:Metabolite) REQUIRE n.metaboliteId IS UNIQUE;

CREATE CONSTRAINT pathway_id_unique IF NOT EXISTS
FOR (n:Pathway) REQUIRE n.pathwayId IS UNIQUE;

// -----------------------------------------------------------------------------
// 1.7 Observation nodes (sample-specific measurements)
// -----------------------------------------------------------------------------
CREATE CONSTRAINT expression_observation_id_unique IF NOT EXISTS
FOR (n:ExpressionObservation) REQUIRE n.expressionObservationId IS UNIQUE;

CREATE CONSTRAINT methylation_observation_id_unique IF NOT EXISTS
FOR (n:MethylationObservation) REQUIRE n.methylationObservationId IS UNIQUE;

CREATE CONSTRAINT variant_observation_id_unique IF NOT EXISTS
FOR (n:VariantObservation) REQUIRE n.variantObservationId IS UNIQUE;

CREATE CONSTRAINT protein_observation_id_unique IF NOT EXISTS
FOR (n:ProteinObservation) REQUIRE n.proteinObservationId IS UNIQUE;

CREATE CONSTRAINT metabolite_observation_id_unique IF NOT EXISTS
FOR (n:MetaboliteObservation) REQUIRE n.metaboliteObservationId IS UNIQUE;

CREATE CONSTRAINT phenotype_observation_id_unique IF NOT EXISTS
FOR (n:PhenotypeObservation) REQUIRE n.phenotypeObservationId IS UNIQUE;

// -----------------------------------------------------------------------------
// 1.8 Rules and evidence
// -----------------------------------------------------------------------------
CREATE CONSTRAINT methylation_status_rule_id_unique IF NOT EXISTS
FOR (n:MethylationStatusRule) REQUIRE n.methylationStatusRuleId IS UNIQUE;

CREATE CONSTRAINT evidence_id_unique IF NOT EXISTS
FOR (n:Evidence) REQUIRE n.evidenceId IS UNIQUE;

// -----------------------------------------------------------------------------
// 1.9 Intervention, perturbation, and agent layer
// -----------------------------------------------------------------------------
// Applies to the base label. Multi-labelled nodes such as (:Intervention:Drug)
// or (:Intervention:Drug:Immunotherapy) are covered by this single constraint.
CREATE CONSTRAINT intervention_id_unique IF NOT EXISTS
FOR (n:Intervention) REQUIRE n.interventionId IS UNIQUE;

CREATE CONSTRAINT chemical_entity_id_unique IF NOT EXISTS
FOR (n:ChemicalEntity) REQUIRE n.chemicalEntityId IS UNIQUE;

CREATE CONSTRAINT procedure_id_unique IF NOT EXISTS
FOR (n:Procedure) REQUIRE n.procedureId IS UNIQUE;

CREATE CONSTRAINT perturbation_id_unique IF NOT EXISTS
FOR (n:Perturbation) REQUIRE n.perturbationId IS UNIQUE;

// -----------------------------------------------------------------------------
// 1.10 Repository and single-cell layer
// -----------------------------------------------------------------------------
CREATE CONSTRAINT repository_id_unique IF NOT EXISTS
FOR (n:Repository) REQUIRE n.repositoryId IS UNIQUE;

CREATE CONSTRAINT single_cell_dataset_id_unique IF NOT EXISTS
FOR (n:SingleCellDataset) REQUIRE n.singleCellDatasetId IS UNIQUE;

CREATE CONSTRAINT cell_set_id_unique IF NOT EXISTS
FOR (n:CellSet) REQUIRE n.cellSetId IS UNIQUE;

CREATE CONSTRAINT cell_type_id_unique IF NOT EXISTS
FOR (n:CellType) REQUIRE n.cellTypeId IS UNIQUE;

CREATE CONSTRAINT cell_state_id_unique IF NOT EXISTS
FOR (n:CellState) REQUIRE n.cellStateId IS UNIQUE;

CREATE CONSTRAINT feature_id_unique IF NOT EXISTS
FOR (n:Feature) REQUIRE n.featureId IS UNIQUE;


// =============================================================================
// 2. PROPERTY-EXISTENCE CONSTRAINTS  [ENTERPRISE EDITION ONLY]
// =============================================================================
// These fail with a syntax/feature error on Community Edition. Uncomment only
// on Enterprise or Aura Professional+. They enforce that every node carries its
// primary key, which protects ingestion pipelines from partial MERGEs.
//
// Alternatively, replace 1.x uniqueness constraints with NODE KEY constraints,
// which combine uniqueness + existence:
//   CREATE CONSTRAINT sample_id_key IF NOT EXISTS
//   FOR (n:Sample) REQUIRE n.sampleId IS NODE KEY;
//
// CREATE CONSTRAINT sample_id_exists IF NOT EXISTS
// FOR (n:Sample) REQUIRE n.sampleId IS NOT NULL;
//
// CREATE CONSTRAINT subject_id_exists IF NOT EXISTS
// FOR (n:Subject) REQUIRE n.subjectId IS NOT NULL;
//
// CREATE CONSTRAINT gene_id_exists IF NOT EXISTS
// FOR (n:Gene) REQUIRE n.geneId IS NOT NULL;
//
// CREATE CONSTRAINT methylation_observation_id_exists IF NOT EXISTS
// FOR (n:MethylationObservation) REQUIRE n.methylationObservationId IS NOT NULL;
//
// CREATE CONSTRAINT expression_observation_id_exists IF NOT EXISTS
// FOR (n:ExpressionObservation) REQUIRE n.expressionObservationId IS NOT NULL;
//
// CREATE CONSTRAINT intervention_id_exists IF NOT EXISTS
// FOR (n:Intervention) REQUIRE n.interventionId IS NOT NULL;


// =============================================================================
// 3. RANGE INDEXES — LOOKUP AND FILTER FIELDS
// =============================================================================
// Per §9.1: index high-frequency filters (sample class, source dataset, assay
// type, gene symbol, ontology IDs) and observation mirror IDs. Properties already
// covered by a uniqueness constraint above are intentionally NOT re-indexed.

// -----------------------------------------------------------------------------
// 3.1 Study, sample, and assay filters
// -----------------------------------------------------------------------------
CREATE INDEX study_source_dataset_index IF NOT EXISTS
FOR (n:Study) ON (n.sourceDataset);

CREATE INDEX subject_species_index IF NOT EXISTS
FOR (n:Subject) ON (n.species);

CREATE INDEX sample_class_index IF NOT EXISTS
FOR (n:Sample) ON (n.sampleClass);

CREATE INDEX sample_type_index IF NOT EXISTS
FOR (n:Sample) ON (n.sampleType);

CREATE INDEX sample_source_dataset_index IF NOT EXISTS
FOR (n:Sample) ON (n.sourceDataset);

// Mirror ID: enables sample -> subject lookup without traversal during ingestion.
CREATE INDEX sample_subject_id_index IF NOT EXISTS
FOR (n:Sample) ON (n.subjectId);

CREATE INDEX assay_type_index IF NOT EXISTS
FOR (n:Assay) ON (n.assayType);

CREATE INDEX assay_is_single_cell_index IF NOT EXISTS
FOR (n:Assay) ON (n.isSingleCellAssay);

CREATE INDEX assay_source_dataset_index IF NOT EXISTS
FOR (n:Assay) ON (n.sourceDataset);

// -----------------------------------------------------------------------------
// 3.2 Ontology-backed identifiers
// -----------------------------------------------------------------------------
CREATE INDEX disease_ontology_id_index IF NOT EXISTS
FOR (n:Disease) ON (n.ontologyId);

CREATE INDEX disease_name_index IF NOT EXISTS
FOR (n:Disease) ON (n.diseaseName);

CREATE INDEX tissue_name_index IF NOT EXISTS
FOR (n:Tissue) ON (n.tissueName);

CREATE INDEX cell_type_name_index IF NOT EXISTS
FOR (n:CellType) ON (n.cellTypeName);

CREATE INDEX pathway_ontology_id_index IF NOT EXISTS
FOR (n:Pathway) ON (n.ontologyId);

// Ontology field retained directly on an observation node (§9.1).
CREATE INDEX phenotype_observation_hpo_id_index IF NOT EXISTS
FOR (n:PhenotypeObservation) ON (n.hpoId);

// -----------------------------------------------------------------------------
// 3.3 Gene, protein, and variant resolution
// -----------------------------------------------------------------------------
CREATE INDEX gene_symbol_index IF NOT EXISTS
FOR (n:Gene) ON (n.symbol);

CREATE INDEX gene_ensembl_id_index IF NOT EXISTS
FOR (n:Gene) ON (n.ensemblGeneId);

CREATE INDEX gene_hgnc_id_index IF NOT EXISTS
FOR (n:Gene) ON (n.hgncId);

CREATE INDEX protein_uniprot_id_index IF NOT EXISTS
FOR (n:Protein) ON (n.uniprotId);

CREATE INDEX protein_gene_id_index IF NOT EXISTS
FOR (n:Protein) ON (n.geneId);

// Composite: coordinate range scans over variants.
CREATE INDEX variant_locus_index IF NOT EXISTS
FOR (n:Variant) ON (n.chromosome, n.positionStart);

CREATE INDEX variant_gene_id_index IF NOT EXISTS
FOR (n:Variant) ON (n.geneId);

CREATE INDEX cpg_site_locus_index IF NOT EXISTS
FOR (n:CpGSite) ON (n.chromosome, n.startPosition);

CREATE INDEX cpg_site_gene_symbol_index IF NOT EXISTS
FOR (n:CpGSite) ON (n.geneSymbol);

CREATE INDEX genomic_region_locus_index IF NOT EXISTS
FOR (n:GenomicRegion) ON (n.chromosome, n.start, n.end);

CREATE INDEX regulatory_element_type_index IF NOT EXISTS
FOR (n:RegulatoryElement) ON (n.elementType);

CREATE INDEX regulatory_element_locus_index IF NOT EXISTS
FOR (n:RegulatoryElement) ON (n.chromosome, n.startPosition);

// -----------------------------------------------------------------------------
// 3.4 Observation mirror IDs and provenance filters
// -----------------------------------------------------------------------------
// Mirror IDs support high-volume ingestion MERGE lookups and agentic filtering.
// Canonical traversal still goes through the relationship, per §9.2.

CREATE INDEX expression_observation_sample_id_index IF NOT EXISTS
FOR (n:ExpressionObservation) ON (n.sampleId);

CREATE INDEX expression_observation_gene_id_index IF NOT EXISTS
FOR (n:ExpressionObservation) ON (n.geneId);

CREATE INDEX expression_observation_source_dataset_index IF NOT EXISTS
FOR (n:ExpressionObservation) ON (n.sourceDataset);

CREATE INDEX methylation_observation_sample_id_index IF NOT EXISTS
FOR (n:MethylationObservation) ON (n.sampleId);

CREATE INDEX methylation_observation_cpg_id_index IF NOT EXISTS
FOR (n:MethylationObservation) ON (n.cpgId);

CREATE INDEX methylation_observation_status_index IF NOT EXISTS
FOR (n:MethylationObservation) ON (n.methylationStatus);

CREATE INDEX methylation_observation_source_dataset_index IF NOT EXISTS
FOR (n:MethylationObservation) ON (n.sourceDataset);

CREATE INDEX variant_observation_sample_id_index IF NOT EXISTS
FOR (n:VariantObservation) ON (n.sampleId);

CREATE INDEX variant_observation_variant_id_index IF NOT EXISTS
FOR (n:VariantObservation) ON (n.variantId);

CREATE INDEX variant_observation_somatic_status_index IF NOT EXISTS
FOR (n:VariantObservation) ON (n.somaticStatus);

// §9.1 — ProteinObservation fields
CREATE INDEX protein_observation_sample_id_index IF NOT EXISTS
FOR (n:ProteinObservation) ON (n.sampleId);

CREATE INDEX protein_observation_protein_id_index IF NOT EXISTS
FOR (n:ProteinObservation) ON (n.proteinId);

CREATE INDEX protein_observation_observation_type_index IF NOT EXISTS
FOR (n:ProteinObservation) ON (n.observationType);

CREATE INDEX protein_observation_source_dataset_index IF NOT EXISTS
FOR (n:ProteinObservation) ON (n.sourceDataset);

// §9.1 — MetaboliteObservation fields
CREATE INDEX metabolite_observation_sample_id_index IF NOT EXISTS
FOR (n:MetaboliteObservation) ON (n.sampleId);

CREATE INDEX metabolite_observation_metabolite_id_index IF NOT EXISTS
FOR (n:MetaboliteObservation) ON (n.metaboliteId);

CREATE INDEX metabolite_observation_observation_type_index IF NOT EXISTS
FOR (n:MetaboliteObservation) ON (n.observationType);

CREATE INDEX metabolite_observation_source_dataset_index IF NOT EXISTS
FOR (n:MetaboliteObservation) ON (n.sourceDataset);

CREATE INDEX phenotype_observation_subject_id_index IF NOT EXISTS
FOR (n:PhenotypeObservation) ON (n.subjectId);

CREATE INDEX phenotype_observation_sample_id_index IF NOT EXISTS
FOR (n:PhenotypeObservation) ON (n.sampleId);

CREATE INDEX phenotype_observation_type_index IF NOT EXISTS
FOR (n:PhenotypeObservation) ON (n.phenotypeType);

// -----------------------------------------------------------------------------
// 3.5 Clinical layer filters
// -----------------------------------------------------------------------------
CREATE INDEX diagnosis_subject_id_index IF NOT EXISTS
FOR (n:Diagnosis) ON (n.subjectId);

CREATE INDEX diagnosis_disease_id_index IF NOT EXISTS
FOR (n:Diagnosis) ON (n.diseaseId);

CREATE INDEX diagnosis_role_index IF NOT EXISTS
FOR (n:Diagnosis) ON (n.diagnosisRole);

CREATE INDEX diagnosis_pathologic_stage_index IF NOT EXISTS
FOR (n:Diagnosis) ON (n.pathologicStage);

CREATE INDEX survival_subject_id_index IF NOT EXISTS
FOR (n:Survival) ON (n.subjectId);

CREATE INDEX survival_type_index IF NOT EXISTS
FOR (n:Survival) ON (n.survivalType);

// -----------------------------------------------------------------------------
// 3.6 Intervention and perturbation filters
// -----------------------------------------------------------------------------
// §9.1 — Intervention fields. `interventionId` is already constraint-backed.
CREATE INDEX intervention_type_index IF NOT EXISTS
FOR (n:Intervention) ON (n.interventionType);

CREATE INDEX intervention_subtype_index IF NOT EXISTS
FOR (n:Intervention) ON (n.interventionSubtype);

CREATE INDEX intervention_sample_id_index IF NOT EXISTS
FOR (n:Intervention) ON (n.sampleId);

CREATE INDEX chemical_entity_name_index IF NOT EXISTS
FOR (n:ChemicalEntity) ON (n.name);

CREATE INDEX chemical_entity_drugbank_id_index IF NOT EXISTS
FOR (n:ChemicalEntity) ON (n.drugBankId);

CREATE INDEX perturbation_sample_id_index IF NOT EXISTS
FOR (n:Perturbation) ON (n.sampleId);

CREATE INDEX perturbation_type_index IF NOT EXISTS
FOR (n:Perturbation) ON (n.perturbationType);

// -----------------------------------------------------------------------------
// 3.7 Single-cell layer (§9.1)
// -----------------------------------------------------------------------------
// `cellSetId`, `singleCellDatasetId`, `repositoryId`, and `cellTypeId` are
// already constraint-backed above; only the source-annotation fields are indexed.
CREATE INDEX cell_set_source_cluster_id_index IF NOT EXISTS
FOR (n:CellSet) ON (n.sourceClusterId);

CREATE INDEX cell_set_source_annotation_field_index IF NOT EXISTS
FOR (n:CellSet) ON (n.sourceAnnotationField);

CREATE INDEX cell_set_source_annotation_value_index IF NOT EXISTS
FOR (n:CellSet) ON (n.sourceAnnotationValue);

CREATE INDEX cell_set_type_index IF NOT EXISTS
FOR (n:CellSet) ON (n.cellSetType);

CREATE INDEX cell_state_name_index IF NOT EXISTS
FOR (n:CellState) ON (n.cellStateName);

CREATE INDEX single_cell_dataset_repository_dataset_id_index IF NOT EXISTS
FOR (n:SingleCellDataset) ON (n.repositoryDatasetId);

CREATE INDEX feature_name_index IF NOT EXISTS
FOR (n:Feature) ON (n.featureName);

// -----------------------------------------------------------------------------
// 3.8 Evidence and publication provenance
// -----------------------------------------------------------------------------
CREATE INDEX evidence_publication_id_index IF NOT EXISTS
FOR (n:Evidence) ON (n.publicationId);

CREATE INDEX evidence_type_index IF NOT EXISTS
FOR (n:Evidence) ON (n.evidenceType);

CREATE INDEX evidence_association_type_index IF NOT EXISTS
FOR (n:Evidence) ON (n.associationType);

CREATE INDEX publication_doi_index IF NOT EXISTS
FOR (n:Publication) ON (n.doi);

CREATE INDEX publication_pmid_index IF NOT EXISTS
FOR (n:Publication) ON (n.pmid);


// =============================================================================
// 4. RELATIONSHIP PROPERTY INDEXES  [OPTIONAL]
// =============================================================================
// Not required by §9.1. Enable only if profiling shows relationship-property
// filters (§8) are hot paths. Each index adds write cost on ingestion.
//
// CREATE INDEX paired_with_pairing_type_index IF NOT EXISTS
// FOR ()-[r:PAIRED_WITH]-() ON (r.pairingType);
//
// CREATE INDEX has_diagnosis_is_primary_index IF NOT EXISTS
// FOR ()-[r:HAS_DIAGNOSIS]-() ON (r.isPrimaryDiagnosis);
//
// CREATE INDEX uses_agent_role_index IF NOT EXISTS
// FOR ()-[r:USES_AGENT]-() ON (r.agentRole);
//
// CREATE INDEX associated_with_gene_association_type_index IF NOT EXISTS
// FOR ()-[r:ASSOCIATED_WITH_GENE]-() ON (r.associationType);
//
// CREATE INDEX regulates_gene_evidence_level_index IF NOT EXISTS
// FOR ()-[r:REGULATES_GENE]-() ON (r.evidenceLevel);
//
// CREATE INDEX supports_association_direction_index IF NOT EXISTS
// FOR ()-[r:SUPPORTS_ASSOCIATION_WITH]-() ON (r.supportDirection);


// =============================================================================
// 5. FULL-TEXT INDEXES — NAME RESOLUTION FOR AGENTIC RETRIEVAL
// =============================================================================
// §9.2 requires the agent to "resolve names carefully ... using ontology IDs,
// stable identifiers, aliases, and full-text search before writing final Cypher."
//
// Query with:
//   CALL db.index.fulltext.queryNodes('entityNameSearch', 'TP53') YIELD node, score

CREATE FULLTEXT INDEX entityNameSearch IF NOT EXISTS
FOR (n:Gene|Protein|Disease|Tissue|Organ|CellType|CellState|Pathway|Metabolite|ChemicalEntity|Procedure)
ON EACH [n.name, n.symbol, n.aliases, n.proteinName, n.diseaseName, n.tissueName,
         n.cellTypeName, n.cellStateName, n.pathwayName, n.metaboliteName,
         n.genericName, n.brandName, n.procedureName];

CREATE FULLTEXT INDEX evidenceTextSearch IF NOT EXISTS
FOR (n:Evidence|Publication)
ON EACH [n.evidenceText, n.claimText, n.title, n.abstract];

CREATE FULLTEXT INDEX studyDescriptionSearch IF NOT EXISTS
FOR (n:Program|Study)
ON EACH [n.programName, n.studyName, n.studyAbbreviation, n.description];


// =============================================================================
// 6. VERIFICATION
// =============================================================================
// Run after the migration. `db.awaitIndexes` blocks until all indexes are ONLINE.

CALL db.awaitIndexes(600);

SHOW CONSTRAINTS YIELD name, type, labelsOrTypes, properties
RETURN type, count(*) AS total, collect(name)[0..5] AS sample
ORDER BY type;

SHOW INDEXES YIELD name, type, state, populationPercent, labelsOrTypes, properties
WHERE state <> 'ONLINE'
RETURN name, type, state, populationPercent, labelsOrTypes, properties;


// =============================================================================
// 7. ROLLBACK  [COMMENTED — uncomment to revert this migration]
// =============================================================================
// Order matters: drop indexes before the constraints that back them is NOT
// required, but dropping a constraint also drops its backing index.
//
// DROP INDEX studyDescriptionSearch IF EXISTS;
// DROP INDEX evidenceTextSearch IF EXISTS;
// DROP INDEX entityNameSearch IF EXISTS;
//
// DROP INDEX publication_pmid_index IF EXISTS;
// DROP INDEX publication_doi_index IF EXISTS;
// ... (repeat for each index in §3)
//
// DROP CONSTRAINT feature_id_unique IF EXISTS;
// DROP CONSTRAINT cell_state_id_unique IF EXISTS;
// ... (repeat for each constraint in §1)
//
// Bulk alternative (DESTRUCTIVE to all schema objects in the database):
//   SHOW CONSTRAINTS YIELD name AS n CALL { WITH n
//     CALL apoc.schema.assert({}, {}) YIELD label RETURN count(*) } RETURN 1;
// Prefer explicit DROP statements in production.
// =============================================================================
