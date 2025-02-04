# Copyright 2023 Observational Health Data Sciences and Informatics
#
# This file is part of Strategus
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Manually delete package from library. Avoids "Already in use" message when rebuilding
unloadNamespace("Strategus")
.rs.restartR()
folder <- system.file(package = "Strategus")
folder
unlink(folder, recursive = TRUE, force = TRUE)
file.exists(folder)

# Format and check code:
styler::style_pkg()
OhdsiRTools::checkUsagePackage("Strategus")
OhdsiRTools::updateCopyrightYearFolder()
OhdsiRTools::findNonAsciiStringsInFolder()
devtools::spell_check()

# Create manual and vignettes:
unlink("extras/Strategus.pdf")
shell("R CMD Rd2pdf ./ --output=extras/Strategus.pdf")

rmarkdown::render("vignettes/CreatingAnalysisSpecification.Rmd",
                  output_file = "../inst/doc/CreatingAnalysisSpecification.pdf",
                  rmarkdown::pdf_document(latex_engine = "pdflatex",
                                          toc = TRUE,
                                          number_sections = TRUE))
unlink("inst/doc/CreatingAnalysisSpecification.tex")

rmarkdown::render("vignettes/CreatingModules.Rmd",
                  output_file = "../inst/doc/CreatingModules.pdf",
                  rmarkdown::pdf_document(latex_engine = "pdflatex",
                                          toc = TRUE,
                                          number_sections = TRUE))
unlink("inst/doc/CreatingModules.tex")

rmarkdown::render("vignettes/ExecuteStrategus.Rmd",
                  output_file = "../inst/doc/ExecuteStrategus.pdf",
                  rmarkdown::pdf_document(latex_engine = "pdflatex",
                                          toc = TRUE,
                                          number_sections = TRUE))
unlink("inst/doc/ExecuteStrategus.tex")

rmarkdown::render("vignettes/IntroductionToStrategus.Rmd",
                  output_file = "../inst/doc/IntroductionToStrategus.pdf",
                  rmarkdown::pdf_document(latex_engine = "pdflatex",
                                          toc = TRUE,
                                          number_sections = TRUE))
unlink("inst/doc/IntroductionToStrategus.tex")

pkgdown::build_site()
OhdsiRTools::fixHadesLogo()


# Maintain a list of supported modules ------------

# CDM Modules
moduleList <- data.frame(module = "CharacterizationModule",
                         version = "v0.2.3",
                         remoteRepo = "github.com",
                         remoteUsername = "OHDSI",
                         moduleType = "cdm")
moduleList <- rbind(moduleList,
                    data.frame(module = "CohortDiagnosticsModule",
                               version = "v0.0.7",
                               remoteRepo = "github.com",
                               remoteUsername = "OHDSI",
                               moduleType = "cdm"))
moduleList <- rbind(moduleList,
                    data.frame(module = "CohortGeneratorModule",
                               version = "v0.1.0",
                               remoteRepo = "github.com",
                               remoteUsername = "OHDSI",
                               moduleType = "cdm"))
moduleList <- rbind(moduleList,
                    data.frame(module = "CohortIncidenceModule",
                               version = "v0.0.6",
                               remoteRepo = "github.com",
                               remoteUsername = "OHDSI",
                               moduleType = "cdm"))

moduleList <- rbind(moduleList,
                    data.frame(module = "CohortMethodModule",
                               version = "v0.1.0",
                               remoteRepo = "github.com",
                               remoteUsername = "OHDSI",
                               moduleType = "cdm"))
moduleList <- rbind(moduleList,
                    data.frame(module = "PatientLevelPredictionModule",
                               version = "v0.0.7",
                               remoteRepo = "github.com",
                               remoteUsername = "OHDSI",
                               moduleType = "cdm"))
moduleList <- rbind(moduleList,
                    data.frame(module = "SelfControlledCaseSeriesModule",
                               version = "v0.1.2",
                               remoteRepo = "github.com",
                               remoteUsername = "OHDSI",
                               moduleType = "cdm"))

# Results Modules
moduleList <- rbind(moduleList,
                    data.frame(module = "EvidenceSynthesisModule",
                               version = "v0.1.3",
                               remoteRepo = "github.com",
                               remoteUsername = "OHDSI",
                               moduleType = "results"))

CohortGenerator::writeCsv(x = moduleList,
                          file = "inst/csv/modules.csv")



