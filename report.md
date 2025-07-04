# Concept of SciWIn as part of the reproducible science toolset in FAIRagro

## Thematic note

This text is deliverable D4.4.1 of Measure 4.4. in Task Area 4 of the NFDI
consortium FAIRagro. "SciWIn" stands for **Sci**entific **W**orkflow
**In**frastructure and denotes the overall delivrable of Measure 4.4. This
document concludes Action 1 of Measure 4.4. The title set forth in the proposal
[@ewert2023] was "Joint concept of SciWIn as part of the RDC semantic toolset"
Several assumptions made at the time of writing the proposal did not
materialize. It was therefore necessary to adapt the direction of the project
and consequently the thrust of its conceptualization.

### The missing Research Data Commons

The proposal foresaw the integration of SciWIn into a joint infrastructure
involving in particular an "RDC mediation layer" [@ewert2023], where "RDC" stands for "Research Data Commons".
RDC was anticipated to become "an overarching virtual expandable infrastructure" [@glockner2020] hosting "cross-cutting services for the NFDI" [@bierwirth2020].
While @glockner2020 and @bierwirth2020 are mere declarations of intent,
the consortium NFDI4BioDiversity proposed to establish RDC as a cloud-based research infrastructure
and provided a high-level architectural layered concept for RDC [@glockner2020a]
into which SciWIn was supposed to be integrated.

In addition to "RDC" as infrastructure, the term "RDC" was also used in the FAIRagro proposal in the sense of a set of criteria that services should fulfil be be interoperable with the NFDI-wide infrastructure. It was proposed that "FAIRagro will comply with the NFDI-RDC" and that "Storage Instances [of M4.4] ... will hold RDC-compliant FAIR DOs ..."

In June 2024 we organized a meeting with stakeholders from NFDI4Biodiversity, which were involved in the design and
implementation of the NFDI4BioDiversity-specific RDC (Bio-RDC).
It turned out that at that point in time, RDC existed as "a blueprint", an "architectural model" and a collection of specfic individual services, namely

 + An image annotation software, [BIIGLE](https://biigle.de/)
 + The terminology-related [BiodivPortal](biodivportal.gfbio.org) (not reachable at
   the time of writing)
 + A search engine for biological data [GFBio Search](https://search.gfbio.org/)
 + An object storage technology, [Aruna](https://aruna-storage.org/)
 + An AAI-provider, [Life Science Login](https://lifescience-ri.eu/ls-login/) by
   EOSC-Life
 + A KPI monitoring service, [Scorpion](https://scorpion.bi.denbi.de/)

The conceptual ideas had no actionable specification or reference implementation
and also seemed to be still in flux. A move to a more domain-oriented
decentralized architectural paradigm (["data mesh
concept"](https://www.datamesh-architecture.com/)) was considered. The six approved RDC services on the other hand did not bear direct touching
points with SciWIn or FAIRagro. A list of criteria that services should fulfil in order to be "RDC compliant" was planned by TA4 of NFDI4Biodiversity but not yet published.

### Changed Directions

Under these circumstances we had to deal with the fact that there did not exist
an "RDC" or an "RDC semantic toolset" into which SciWIn could have been
meaningfully integrated. Also the realization of such a thing did not seem
likely in a timeframe that would allow to take it into account in the planning
and design of SciWIn. Another consequence of the lack of RDC or a clear path
towards its realization was the lack of FAIRagro external cooperation partners
to develop a "joint concept" with respect to "the RDC semantic toolset".

In order to stay true to the spirit of this action as originally considered, we
developed a set of goals to capture the essence of Action 1. Drawing from
@bierwirth2020, @glockner2020 and @diepenbroek2023, we defined characteristics that
would 1) increase the chance for SciWIn to become a part of an NFDI-RDC if that
concept were actually implemented, and 2) maximize cross-domain usage,
usefulness and synergies in any case:

1. While primarily use-cases and requirement from the agrosystem science
   community drive SciWIn's developent in FAIRagro, it should nevertheless be
   domain-agnostic and potentially unleash its full potential also in other
   quantitative research domains.
2. SciWIn tools and services should be easily accessible for researchers from
   other NFDI concortial and other domains in general. 
3. SciWIn should be based on data formats and protocols that are well
   established, domain-agnostic and future-proof to maximize the chances for
   wide adoption and interoperability.
4. SciWIn should actively exploit existing servcies and services that are currently  
   being developed
   + to avoid re-invention of the wheel,
   + to increase development efficiency and
   + to be exposed early on to the greater research ecosystem

## SciWIn components

The original idea of the SciWIn design, as laid out in an ecosystem map (@ewert2023, Figure 16) features five components:

1. An AAI provider,
2. The "Workflow Hub",
3. Compute instances,
4. Storage instances, and
5. Workflow Objects

In that conceptualization, only the "Workflow Hub" was supposed to be developed
an a dedicated infrastructure item by SciWIn, while the other components are existing services that communicate with the "Workflow Hub". The main purpose of the "Workflow Hub" was the creation of "Workflow Objects".

The actual desing differs from this early sketch. Realizing that the main
challenge to be solved lies in the provisioning of tooling for the easy creation
of workflows, this task is now assigned to a stand-alone program that scientists
use at their workstations in their daily workflow without requiring
internet-access, a central service, or authorization. This stand-along program
is called **SciWIn-Client**. The second important function of **SciWIn-Client**
is the communication with compute instances to enable scientists to submit
computational workflows for remote execution and fetch the results.
SciWIn-Client thus implements the functionality that was assigned to "Workflow
Hub" in the initial sketch in the proposal.

In addition to **SciWIn-Client** we are planning to realize a second
software-project within Measure 4.4, the **SciWIn-Hub**. The need for SciWIn-Hub
stems from the realization that the data repositories ("Storage Instances" such
as _e!DAL-PGP_, _Bonares_, _TISDAR_[^1] in the proposal) are not suited to
FAIRly handle computational workflows to realize the full potential of
re-usable, re-combineable, modular computational workflows. The existing
repositories are still useful in this context to publish workflows as citeable
scientific output that is reliably preserved over long time-spans. However, a
programatically driven, non interactive submission of content is not possible
with such repositories, and sometimes even reading data requires interactive operation.

Access to SciWIn-Hub and other services, such as the __FAIRagro Searchable
Inventory of Services and Data_ (@ewert2023, pp. 94-96) and compute instances,
will be managed by the NFDI-wide Base4NFDI project _IAM4NFDI_, that is supported
by the Working Group Identity and Access Management (@pempe2022). Integration of
this AAI solution into FAIRagro is performed by FAIRagro Measure 4.2.
**SciWIn-Client** will implement the respective authorization protocol.

Workflow objects in the SciWIn-context are data structures that encapsulate the
definition of workflows with associated code and data or references to code and
data. Since a close collaboration between FAIRagro and NFDI Consortium DataPLANT
is established on different levels, we have taken into account their version of
a FAIR Digital Object, the Annotated Research Context (ARC), and the established
standards on which it is based. These are the Common Workflow Language (CWL,
@crusoe2022) to specify computational workflows and the Research Object Crate
(RO-Crate, @soiland-reyes2022) as a data structure to package data (which here
also includes code and workflow descriptions). While compatibility with the
advanced tooling and infrastructure of DataPLANT is an important piece to
achieve synergies with this consortium covering a neighboring research domain,
CWL and RO-Crate represent the state-of-the art for workflow descriptions and
semantically annotated metadata formats. Therefore, they are also used or
considered by other NFDI consortial, e.g. NFDI4Ing (@bronger2022) and
NFDI4Health (@lobe2024). Furthermore, the semanitic annotation of metadata
allows for the integration of such FAIR Digital Objects into knowledge graphs
that interconnect.

workflowhub.eu
knowledge graphs


settled on the workflow description
language CWL (@crusoe2022), on
- Compute instances: in principle general CWL capable, in practice reana, in principle any Reana in practice our own
- Workflow objects : Move from ARC as central data structure to multi-data container compatibility.

New components:

AAI
Client
Hub
Storage Instances
Workflow objects now multi-paradigm compatibility
based on provenance run crate.

### SciWIn client

+ requirements
+ target group
+ tech stack
+ use cases

conceptual challenges

remote execution Reana wegen Multicloud
workflow & data
remote reference
dockerization

### Selection of CWL

### Selection of 


### SciWIn-Hub

In progress 
+ requirements
+ target group
+ tech stack
+ use cases

+ "CWL package manager"
+ Visualisierung von Workflows
+ cordra ...

## Development strategy

## Interaction within FAIRagro

+ helpdesk
+ use cases
+ outreach / promotion

+ techn : search findet workflows

## Interaction within NFDI and beyond

+ BASE4NFDI (KG4NFDI, MC (Reana), IAM4NFDI)



## Towards the establishment of SciWIn as a common tool for computational workflows

Use cases,
Outreach
Workshop,
Identify other consortia to co-operate
reach out to other communities






















[diepenbroek2023] The concept of data integration is partly described in the RDC
mediation layer and covered by semantic tools (Glöckner et al., 2020), and a
concept for integrated data and process storage is part of the DataPLANTs ARC
model (Krantz et al., 2021)

## Overall structure: SciWIn-Client and SciWIn-Hub

+ A client-part that works de-centralized, independent of any central infrastructure
  as part of the scientists' daily toolset.
+ Serves to capture computational workflows with minimal effort in a standards
  compliant way.






































# Quotes to be mined

Develop the concept of SciWIn (Measure 4.4) jointly together under the umbrella of the
NFDI-RDC and collaborate with NFDI4BioDiversity and DataPLANT as well as the
prototypic container deployment to the de.NBI cloud node at BLU;


A SciWIn pilot will be rolled out at de.NBI operated by Bielefeld University (BLU).

The concept of data integration is
partly described in the RDC mediation layer and covered by semantic tools (Glöckner et al.,
2020), and a concept for integrated data and process storage is part of the DataPLANTs ARC
model (Krantz et al., 2021), but a fully integrated infrastructure is provided by neither of those
consortia. Therefore, Measure 4.4 will extend the two architectural designs and provide a
workflow infrastructure that applies the FAIR DO concepts (Measure 3.5), the service
middleware components (Measure 4.2) and its own workflow hub as an easy-to-use interface
to work on and create new FAIR DO outputs with automatically annotated provenance graphs.

SciWIn will be part of the NFDI cross-cutting topic “RDC implementations”, and therefore, its
concept will be developed as a joint effort between FAIRagro, FAIR-DS, Dataplant and the NFDI
section, RDC [as part of cross-cutting topics (Ebert et al., 2021)]. Coordinated in Measure 5.3,
the SciWIn working group brings these stakeholders together and will be initiated by a kickoff
meeting (M4.4.1). Thus, the fundamental principles, architectures and interfaces are described,
and a coordinated concept will be created and published (D4.4.1), which will incorporate the
RDC ideas and DataPLANTs ARC model.


[^1]: TISDAR is now called "Thünen-Atlas" and refers to the public repository of
    geospatial data at the Thünen Institute:
    [atlas.thuenen.de](https://atlas.thuenen.de).
