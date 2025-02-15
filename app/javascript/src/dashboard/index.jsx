import React from "react";
import { CurrentlyInkedSummaryWidget } from "./currently_inked_summary_widget";
import { InksGroupedByBrandWidget } from "./inks_grouped_by_brand_widget";
import { InksSummaryWidget } from "./inks_summary_widget";
import { LeaderboardRankingWidget } from "./leaderboard_ranking_widget";
import { PensGroupedByBrandWidget } from "./pens_grouped_by_brand_widget";
import { PensSummaryWidget } from "./pens_summary_widget";
import { InksVisualizationWidget } from "./inks_visualization_widget";
import { createRoot } from "react-dom/client";

document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("dashboard");
  if (el) {
    const root = createRoot(el);
    root.render(<Dashboard />);
  }
});

const Dashboard = () => (
  <div className="fpc-dashboard">
    <CurrentlyInkedSummaryWidget />
    <InksSummaryWidget />
    <PensSummaryWidget />
    <InksGroupedByBrandWidget />
    <PensGroupedByBrandWidget />
    <InksVisualizationWidget />
    <LeaderboardRankingWidget />
  </div>
);
