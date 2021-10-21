
# Welcome to the Liver disease app

> a web application to browse gene regulation of chronic and acute liver
> disease

The prevalence of chronic liver diseases (CLD) has increased during the
last decades. Mouse models are frequently used to study the
pathophysiology of liver diseases, identify therapeutic targets, and
test drug candidates.

To allow a better assessment of translational relevance from mouse
models to human CLD we analyzed genome-wide transcriptome data from
seven mouse models (one with chronic and six with acute liver damage)
comprising 227 mice and five studies of human CLD with a total of 372
patients. See the table below for a summary of the analyzed datasets.

<div id="cizzvnakqx" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#cizzvnakqx .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#cizzvnakqx .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cizzvnakqx .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#cizzvnakqx .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#cizzvnakqx .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cizzvnakqx .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cizzvnakqx .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#cizzvnakqx .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#cizzvnakqx .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#cizzvnakqx .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#cizzvnakqx .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#cizzvnakqx .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#cizzvnakqx .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#cizzvnakqx .gt_from_md > :first-child {
  margin-top: 0;
}

#cizzvnakqx .gt_from_md > :last-child {
  margin-bottom: 0;
}

#cizzvnakqx .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#cizzvnakqx .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#cizzvnakqx .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cizzvnakqx .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#cizzvnakqx .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cizzvnakqx .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#cizzvnakqx .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#cizzvnakqx .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cizzvnakqx .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cizzvnakqx .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#cizzvnakqx .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cizzvnakqx .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#cizzvnakqx .gt_left {
  text-align: left;
}

#cizzvnakqx .gt_center {
  text-align: center;
}

#cizzvnakqx .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#cizzvnakqx .gt_font_normal {
  font-weight: normal;
}

#cizzvnakqx .gt_font_bold {
  font-weight: bold;
}

#cizzvnakqx .gt_font_italic {
  font-style: italic;
}

#cizzvnakqx .gt_super {
  font-size: 65%;
}

#cizzvnakqx .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="5" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Mouse Models and Patient Cohorts With Genome-Wide Expression Data of Liver Tissue</th>
    </tr>
    
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Organism</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Damage</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Treatment</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Sample size</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Accession ID</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">Mouse</td>
<td class="gt_row gt_left">Chronic</td>
<td class="gt_row gt_left">CCl4 (up to 12 months)</td>
<td class="gt_row gt_right">36</td>
<td class="gt_row gt_left">GSE167216</td></tr>
    <tr><td class="gt_row gt_left">Mouse</td>
<td class="gt_row gt_left">Acute</td>
<td class="gt_row gt_left">APAP (up to 16 days)</td>
<td class="gt_row gt_right">49</td>
<td class="gt_row gt_left">GSE167032</td></tr>
    <tr><td class="gt_row gt_left">Mouse</td>
<td class="gt_row gt_left">Acute</td>
<td class="gt_row gt_left">CCl4 (up to 16 days)</td>
<td class="gt_row gt_right">46</td>
<td class="gt_row gt_left">GSE167033</td></tr>
    <tr><td class="gt_row gt_left">Mouse</td>
<td class="gt_row gt_left">Acute</td>
<td class="gt_row gt_left">Partial hepatectomy (up to 3 months)</td>
<td class="gt_row gt_right">52</td>
<td class="gt_row gt_left">GSE167034</td></tr>
    <tr><td class="gt_row gt_left">Mouse</td>
<td class="gt_row gt_left">Acute</td>
<td class="gt_row gt_left">BDL (up to 3 weeks)</td>
<td class="gt_row gt_right">29</td>
<td class="gt_row gt_left">GSE166867</td></tr>
    <tr><td class="gt_row gt_left">Mouse</td>
<td class="gt_row gt_left">Acute</td>
<td class="gt_row gt_left">LPS (24 hours)</td>
<td class="gt_row gt_right">8</td>
<td class="gt_row gt_left">GSE166488</td></tr>
    <tr><td class="gt_row gt_left">Mouse</td>
<td class="gt_row gt_left">Acute</td>
<td class="gt_row gt_left">Tunicamycin (6 hours)</td>
<td class="gt_row gt_right">7</td>
<td class="gt_row gt_left">GSE29929</td></tr>
    <tr><td class="gt_row gt_left">Human</td>
<td class="gt_row gt_left">Chronic</td>
<td class="gt_row gt_left">Mild vs. advanced NAFLD</td>
<td class="gt_row gt_right">72</td>
<td class="gt_row gt_left">GSE49541</td></tr>
    <tr><td class="gt_row gt_left">Human</td>
<td class="gt_row gt_left">Chronic</td>
<td class="gt_row gt_left">Full spectrum of NAFLD</td>
<td class="gt_row gt_right">78</td>
<td class="gt_row gt_left">GSE130970</td></tr>
    <tr><td class="gt_row gt_left">Human</td>
<td class="gt_row gt_left">Chronic</td>
<td class="gt_row gt_left">NAFLD and NASH</td>
<td class="gt_row gt_right">46</td>
<td class="gt_row gt_left">GSE48452</td></tr>
    <tr><td class="gt_row gt_left">Human</td>
<td class="gt_row gt_left">Chronic</td>
<td class="gt_row gt_left">NASH, NAFLD, PBC, and PSC</td>
<td class="gt_row gt_right">109</td>
<td class="gt_row gt_left">GSE61260</td></tr>
    <tr><td class="gt_row gt_left">Human</td>
<td class="gt_row gt_left">Chronic</td>
<td class="gt_row gt_left">HCV and NAFLD</td>
<td class="gt_row gt_right">67</td>
<td class="gt_row gt_left">E-MTAB-6863</td></tr>
  </tbody>
  
  
</table>
</div>

See the corresponding publication for more details: [*Transcriptomic
cross-species analysis of chronic liver disease reveals consistent
regulation between humans and mice*](https://doi.org/10.1002/hep4.1797).

### About

This application informs for any gene of interest on:

-   mean expression changes in the chronic and acute mouse models and in
    patients of different liver disease etiologies. Users may choose to
    show the log-fold changes or the t-statistic both derived from a
    differential gene expression analysis.

-   the categorization into genes that are altered exclusively during
    acute or chronic damage or commonly deregulated in both acute and
    chronic mouse models. The displayed rank in the *chronicity* box
    provides information about the reliability, with rank 1 being the
    most reliable. This classification comprises in total 3,758 genes.
    The complete list is available at the `data` tab.

-   the associated cell type in which we found the gene also
    significantly deregulated between cirrhotic and healthy patients.
    This information was inferred from a publicly available single-cell
    RNA-seq data by [Ramachandran et al., Nature,
    2019](https://www.nature.com/articles/s41586-019-1631-3?proof=t).

-   if the gene is consistently altered in mice and humans. If this is
    true, the rank is displayed. See the *consistency* box. The better
    the displayed rank (from low to high) the stronger the gene is
    consistently altered in human and mice. Please visit the `data` tab
    to see the full list of genes.

### How to cite?

> Holland CH, Ramirez Flores RO, Myllys M, Hassan R, Edlund K, Hofmann
> U, Marchan R, Cadenas C, Reinders J, Hoehme S, Seddek A, Dooley S,
> Keitel V, Godoy P, Begher-Tibbe B, Trautwein C, Rupp C, Mueller S,
> Longerich T, Hengstler JG<sup>\#</sup>, Saez-Rodriguez J<sup>\#</sup>,
> Ghallab A<sup>\#</sup>. “Transcriptomic cross-species analysis of
> chronic liver disease reveals consistent regulation between humans and
> mice.” *Hepatology Communications*. 2021. DOI:
> [10.1002/hep4.1797](https://doi.org/10.1002/hep4.1797).

^\# *Shared senior authorship*
